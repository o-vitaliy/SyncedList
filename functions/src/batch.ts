// Pure logic for list-change notifications, kept free of Firebase so it can
// be unit-tested (batch.test.ts).
//
// notifications/{listId} holds:
// - pending: changes made since the current 30-second window opened, one
//   entry per item, so the latest state of an item wins.
// - windowEndsAt: when the queued send task runs (millis), or null when no
//   window is open.
// - unseen: per member, the running total of what others changed since that
//   member last opened the list. The app clears its own entry on open.

/** How long changes are collected before one notification is sent. */
export const WINDOW_SECONDS = 30;

/**
 * A window whose task never ran (failed to enqueue, or retries ran out) is
 * treated as closed after this long, so the next change opens a new one.
 */
export const STALE_WINDOW_MS = 5 * 60 * 1000;

export interface PendingItem {
  value: string;
  at: number;
  /** Set when the item was created in this window. */
  addedBy?: string;
  /** Set when the item was checked or unchecked in this window. */
  done?: boolean;
  doneBy?: string;
}

export interface SeenItem {
  value: string;
  at: number;
}

export interface Unseen {
  added: Record<string, SeenItem>;
  done: Record<string, SeenItem>;
  /** Uids of the members who made these changes. */
  by: string[];
}

export interface NotificationDoc {
  pending: Record<string, PendingItem>;
  windowEndsAt: number | null;
  unseen: Record<string, Unseen>;
}

export type ItemChange =
  | { kind: "added"; itemId: string; value: string; by: string }
  | { kind: "done"; itemId: string; value: string; done: boolean; by: string }
  | { kind: "renamed"; itemId: string; value: string }
  | { kind: "deleted"; itemId: string };

type ItemData = { value?: unknown; done?: unknown; updatedBy?: unknown };

/**
 * Turns a write to items/{listId}/products/{itemId} into a change worth
 * reporting, or null. Writes without `updatedBy` (older app versions) can't
 * say who made them, so only renames and deletes of them are tracked.
 * Reorders only touch `order` and are ignored.
 */
export function toChange(
  itemId: string,
  before: ItemData | undefined,
  after: ItemData | undefined,
): ItemChange | null {
  if (!after) return before ? { kind: "deleted", itemId } : null;

  const value = typeof after.value === "string" ? after.value : "";
  const by = typeof after.updatedBy === "string" ? after.updatedBy : null;

  if (!before) {
    return by ? { kind: "added", itemId, value, by } : null;
  }
  if (before.done !== after.done && typeof after.done === "boolean") {
    return by ? { kind: "done", itemId, value, done: after.done, by } : null;
  }
  if (before.value !== after.value) {
    return { kind: "renamed", itemId, value };
  }
  return null;
}

export function emptyDoc(): NotificationDoc {
  return { pending: {}, windowEndsAt: null, unseen: {} };
}

/** Reads a stored doc, tolerating missing or malformed fields. */
export function parseDoc(data: Record<string, unknown> | undefined): NotificationDoc {
  if (!data) return emptyDoc();
  const windowEndsAt = data.windowEndsAt;
  return {
    pending: isObject(data.pending) ? (data.pending as Record<string, PendingItem>) : {},
    windowEndsAt: typeof windowEndsAt === "number" ? windowEndsAt : null,
    unseen: isObject(data.unseen) ? normalizeUnseen(data.unseen as Record<string, unknown>) : {},
  };
}

function normalizeUnseen(raw: Record<string, unknown>): Record<string, Unseen> {
  const out: Record<string, Unseen> = {};
  for (const [uid, value] of Object.entries(raw)) {
    if (!isObject(value)) continue;
    const v = value as Partial<Unseen>;
    out[uid] = {
      added: isObject(v.added) ? v.added! : {},
      done: isObject(v.done) ? v.done! : {},
      by: Array.isArray(v.by) ? v.by.filter((e) => typeof e === "string") : [],
    };
  }
  return out;
}

function isObject(v: unknown): boolean {
  return typeof v === "object" && v !== null && !Array.isArray(v);
}

export interface ApplyResult {
  doc: NotificationDoc;
  /** Set when this change opened a window: the send task must be queued. */
  scheduleAt?: number;
}

/**
 * Records [change] in [doc]. Returns null when nothing changed (for example,
 * a rename of an item that isn't in any pending or unseen entry).
 */
export function applyChange(
  doc: NotificationDoc,
  change: ItemChange,
  now: number,
): ApplyResult | null {
  const next: NotificationDoc = structuredClone(doc);
  const id = change.itemId;

  switch (change.kind) {
    case "added":
      next.pending[id] = { value: change.value, at: now, addedBy: change.by };
      break;
    case "done": {
      const p = next.pending[id] ?? { value: change.value, at: now };
      next.pending[id] = { ...p, value: change.value, at: now, done: change.done, doneBy: change.by };
      break;
    }
    case "renamed": {
      let touched = false;
      if (next.pending[id]) {
        next.pending[id].value = change.value;
        touched = true;
      }
      for (const u of Object.values(next.unseen)) {
        if (u.added[id]) (u.added[id].value = change.value), (touched = true);
        if (u.done[id]) (u.done[id].value = change.value), (touched = true);
      }
      return touched ? { doc: next } : null;
    }
    case "deleted": {
      let touched = false;
      if (next.pending[id]) {
        delete next.pending[id];
        touched = true;
      }
      for (const u of Object.values(next.unseen)) {
        if (u.added[id]) delete u.added[id], (touched = true);
        if (u.done[id]) delete u.done[id], (touched = true);
      }
      return touched ? { doc: next } : null;
    }
  }

  // An added or checked item: open a window unless one is already open.
  const open = next.windowEndsAt !== null && next.windowEndsAt > now - STALE_WINDOW_MS;
  if (open) return { doc: next };
  next.windowEndsAt = now + WINDOW_SECONDS * 1000;
  return { doc: next, scheduleAt: next.windowEndsAt };
}

export interface FlushResult {
  doc: NotificationDoc;
  /** Members whose running total grew in this window: they get a push. */
  notify: string[];
}

/**
 * Closes the window: folds the pending changes into every member's running
 * total, leaving out each member's own changes, and drops the totals of
 * people who are no longer members.
 */
export function flush(doc: NotificationDoc, members: string[]): FlushResult {
  const unseen: Record<string, Unseen> = {};
  const notify: string[] = [];

  for (const uid of members) {
    const u: Unseen = structuredClone(doc.unseen[uid] ?? { added: {}, done: {}, by: [] });
    let grew = false;

    for (const [id, p] of Object.entries(doc.pending)) {
      const seen = { value: p.value, at: p.at };
      if (p.addedBy && p.addedBy !== uid) {
        u.added[id] = seen;
        addActor(u, p.addedBy);
        grew = true;
      }
      if (p.done === true && p.doneBy && p.doneBy !== uid) {
        u.done[id] = seen;
        addActor(u, p.doneBy);
        grew = true;
      } else if (p.done === false && u.done[id]) {
        // Unchecked again: it no longer counts as checked off.
        delete u.done[id];
      }
    }

    const empty = Object.keys(u.added).length === 0 && Object.keys(u.done).length === 0;
    if (!empty) unseen[uid] = u;
    if (grew && !empty) notify.push(uid);
  }

  return { doc: { pending: {}, windowEndsAt: null, unseen }, notify };
}

function addActor(u: Unseen, uid: string) {
  if (!u.by.includes(uid)) u.by.push(uid);
}
