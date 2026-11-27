import assert from "node:assert/strict";
import { test } from "node:test";

import { applyChange, emptyDoc, flush, isUnregistered, NotificationDoc, STALE_WINDOW_MS, toChange, WINDOW_SECONDS } from "./batch";
import { buildNotification, pickLocale } from "./texts";

const A = "anna";
const B = "bob";

function apply(doc: NotificationDoc, change: Parameters<typeof applyChange>[1], now: number) {
  const r = applyChange(doc, change, now);
  assert.ok(r);
  return r;
}

test("toChange: create, check, rename, reorder, delete", () => {
  assert.deepEqual(toChange("i", undefined, { value: "Milk", done: false, updatedBy: A }), {
    kind: "added", itemId: "i", value: "Milk", by: A,
  });
  assert.deepEqual(
    toChange("i", { value: "Milk", done: false }, { value: "Milk", done: true, updatedBy: B }),
    { kind: "done", itemId: "i", value: "Milk", done: true, by: B },
  );
  assert.deepEqual(toChange("i", { value: "Milk" }, { value: "Oat milk" }), {
    kind: "renamed", itemId: "i", value: "Oat milk",
  });
  assert.equal(toChange("i", { value: "Milk", done: false, order: 1 } as never, { value: "Milk", done: false, order: 2 } as never), null);
  assert.deepEqual(toChange("i", { value: "Milk" }, undefined, B), {
    kind: "deleted", itemId: "i", value: "Milk", by: B,
  });
  // A server-side delete has nobody to credit.
  assert.deepEqual(toChange("i", { value: "Milk" }, undefined), {
    kind: "deleted", itemId: "i", value: "Milk", by: undefined,
  });
  // Without updatedBy (older app versions), the auth context says who wrote.
  assert.deepEqual(toChange("i", undefined, { value: "Milk", done: false }, B), {
    kind: "added", itemId: "i", value: "Milk", by: B,
  });
  // updatedBy wins over the auth context.
  assert.equal(toChange("i", undefined, { value: "Milk", updatedBy: A }, B)?.kind, "added");
  assert.deepEqual(toChange("i", undefined, { value: "Milk", updatedBy: A }, B), {
    kind: "added", itemId: "i", value: "Milk", by: A,
  });
  // Neither: nobody to credit, no push.
  assert.equal(toChange("i", undefined, { value: "Milk", done: false }), null);
});

test("the first change opens a 10 s window, later ones join it", () => {
  const first = apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1000);
  assert.equal(first.scheduleAt, 1000 + WINDOW_SECONDS * 1000);
  const second = apply(first.doc, { kind: "done", itemId: "2", value: "Eggs", done: true, by: A }, 5000);
  assert.equal(second.scheduleAt, undefined);
  assert.equal(Object.keys(second.doc.pending).length, 2);
});

test("a stuck window is replaced", () => {
  const doc = { ...emptyDoc(), windowEndsAt: 1000 };
  const r = apply(doc, { kind: "added", itemId: "1", value: "Milk", by: A }, 1000 + STALE_WINDOW_MS + 1);
  assert.ok(r.scheduleAt);
});

test("flush leaves out the member's own changes and keeps a running total", () => {
  let doc = apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc;
  let f = flush(doc, [A, B]);
  assert.deepEqual(f.notify, [B]);
  assert.equal(f.doc.unseen[A], undefined);
  assert.deepEqual(Object.keys(f.doc.unseen[B].added), ["1"]);
  assert.equal(f.doc.windowEndsAt, null);

  doc = apply(f.doc, { kind: "done", itemId: "2", value: "Eggs", done: true, by: A }, 2).doc;
  f = flush(doc, [A, B]);
  assert.deepEqual(f.notify, [B]);
  assert.deepEqual(Object.keys(f.doc.unseen[B].added), ["1"]);
  assert.deepEqual(Object.keys(f.doc.unseen[B].done), ["2"]);
  assert.deepEqual(f.doc.unseen[B].by, [A]);
});

test("unchecking and deleting take items out of the total", () => {
  let doc = apply(emptyDoc(), { kind: "done", itemId: "1", value: "Milk", done: true, by: A }, 1).doc;
  doc = flush(doc, [A, B]).doc;
  doc = apply(doc, { kind: "done", itemId: "1", value: "Milk", done: false, by: A }, 2).doc;
  let f = flush(doc, [A, B]);
  assert.deepEqual(f.notify, []);
  assert.equal(f.doc.unseen[B], undefined);

  // Added and removed within one window: nothing to report.
  doc = apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc;
  doc = apply(doc, { kind: "deleted", itemId: "1", value: "Milk", by: A }, 2).doc;
  f = flush(doc, [A, B]);
  assert.deepEqual(f.notify, []);
});

test("removing an item notifies the others", () => {
  // Bob already saw Milk (it isn't in his running total).
  const r = apply(emptyDoc(), { kind: "deleted", itemId: "1", value: "Milk", by: A }, 5);
  assert.ok(r.scheduleAt, "a removal opens a window");
  const f = flush(r.doc, [A, B]);
  assert.deepEqual(f.notify, [B]);
  assert.deepEqual(f.doc.unseen[B].removed, { 1: { value: "Milk", at: 5 } });
  assert.deepEqual(f.doc.unseen[B].by, [A]);
  assert.equal(f.doc.unseen[A], undefined);
});

test("removing an item the member hasn't seen cancels its add", () => {
  // Anna adds Milk; Bob gets "Added: Milk" but doesn't open the list.
  let doc = flush(apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc, [A, B]).doc;
  // Anna checks Eggs off, then removes Milk in a later window.
  doc = apply(doc, { kind: "done", itemId: "2", value: "Eggs", done: true, by: A }, 20_000).doc;
  doc = apply(doc, { kind: "deleted", itemId: "1", value: "Milk", by: A }, 21_000).doc;
  const f = flush(doc, [A, B]);
  assert.deepEqual(f.doc.unseen[B].added, {});
  assert.deepEqual(f.doc.unseen[B].removed, {});
  assert.deepEqual(Object.keys(f.doc.unseen[B].done), ["2"]);
});

test("a removed item no longer counts as checked off", () => {
  let doc = flush(apply(emptyDoc(), { kind: "done", itemId: "1", value: "Milk", done: true, by: A }, 1).doc, [A, B]).doc;
  doc = apply(doc, { kind: "deleted", itemId: "1", value: "Milk", by: A }, 20_000).doc;
  const f = flush(doc, [A, B]);
  assert.deepEqual(f.doc.unseen[B].done, {});
  assert.deepEqual(Object.keys(f.doc.unseen[B].removed), ["1"]);
});

test("a server-side delete drops the item without a push", () => {
  let doc = flush(apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc, [A, B]).doc;
  const r = apply(doc, { kind: "deleted", itemId: "1", value: "Milk" }, 20_000);
  assert.equal(r.scheduleAt, undefined);
  assert.deepEqual(r.doc.unseen[B].added, {});
  doc = r.doc;
  assert.deepEqual(flush(doc, [A, B]).notify, []);
});

test("people who left the list are dropped", () => {
  const doc = apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc;
  const f = flush({ ...doc, unseen: { gone: { added: { x: { value: "x", at: 0 } }, done: {}, removed: {}, by: [A] } } }, [A, B]);
  assert.deepEqual(Object.keys(f.doc.unseen), [B]);
});

test("notification text", () => {
  const unseen = {
    added: {
      a: { value: "Milk", at: 4 }, b: { value: "Bread", at: 3 },
      c: { value: "Eggs", at: 2 }, d: { value: "Tea", at: 1 },
    },
    done: { e: { value: "Butter", at: 5 } },
    removed: {},
    by: [A],
  };
  assert.deepEqual(buildNotification("Groceries", unseen, ["Anna"], "en_US"), {
    title: "Groceries",
    body: "Anna — Added: Milk, Bread, Eggs and 1 more\nChecked off: Butter",
  });
  assert.equal(
    buildNotification("Groceries", { ...unseen, removed: { f: { value: "Jam", at: 6 } } }, ["Anna"], "en").body,
    "Anna — Added: Milk, Bread, Eggs and 1 more\nChecked off: Butter\nRemoved: Jam",
  );
  assert.equal(
    buildNotification("Продукти", { added: {}, done: {}, removed: { f: { value: "Jam", at: 6 } }, by: [] }, [], "uk").body,
    "Видалено: Jam",
  );
  assert.equal(
    buildNotification("Продукти", unseen, ["Анна", "Богдан"], "uk").body,
    "Анна і Богдан — Додано: Milk, Bread, Eggs і ще 1\nКуплено: Butter",
  );
  assert.equal(
    buildNotification("Продукты", unseen, ["Анна", "Боб"], "ru").body,
    "Анна и Боб — Добавлено: Milk, Bread, Eggs и ещё 1\nКуплено: Butter",
  );
  assert.equal(
    buildNotification("Einkauf", unseen, ["Anna"], "de-AT").body,
    "Anna — Hinzugefügt: Milk, Bread, Eggs und 1 weitere\nAbgehakt: Butter",
  );
  assert.equal(pickLocale("pt-BR"), "pt");
  assert.equal(pickLocale("zh-Hans-CN"), "en");
  assert.equal(pickLocale("constructor"), "en");
  assert.equal(buildNotification("G", { added: {}, done: unseen.done, removed: {}, by: [] }, [], undefined).body, "Checked off: Butter");
});

test("only unregistered devices are removed", () => {
  assert.ok(isUnregistered("messaging/installation-id-not-registered"));
  assert.ok(isUnregistered("messaging/registration-token-not-registered"));
  assert.equal(isUnregistered("messaging/invalid-argument"), false);
  assert.equal(isUnregistered("messaging/mismatched-credential"), false);
  assert.equal(isUnregistered(undefined), false);
});
