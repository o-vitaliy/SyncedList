// Push notifications for shared lists.
//
// 1. onItemWritten records every add / check-off in notifications/{listId}
//    and, on the first change of a quiet list, queues sendListUpdates to run
//    10 seconds later (a fixed window: later changes join the same batch).
// 2. sendListUpdates folds the batch into each member's running total and
//    pushes it to the members who didn't make the changes. The push uses the
//    list id as its tag / collapse id, so it replaces the previous one for
//    that list and leaves other lists' notifications alone.
// 3. The app clears a member's total (notifications/{listId}.unseen.{uid})
//    when they open the list.

import { initializeApp } from "firebase-admin/app";
import { getAuth } from "firebase-admin/auth";
import { getFirestore } from "firebase-admin/firestore";
import { getFunctions } from "firebase-admin/functions";
import { getMessaging, Message } from "firebase-admin/messaging";
import { logger } from "firebase-functions";
import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { onTaskDispatched } from "firebase-functions/v2/tasks";

import { applyChange, flush, parseDoc, toChange, Unseen } from "./batch";
import { buildNotification } from "./texts";

initializeApp();
const db = getFirestore();

const REGION = "us-central1";
const SEND_TASK = "sendListUpdates";
const WEB_APP = "https://syncedlist.web.app";

export const onItemWritten = onDocumentWritten(
  { document: "items/{listId}/products/{itemId}", region: REGION },
  async (event) => {
    const { listId, itemId } = event.params;
    const change = toChange(itemId, event.data?.before.data(), event.data?.after.data());
    if (!change) return;

    const ref = db.doc(`notifications/${listId}`);
    const scheduleAt = await db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      const result = applyChange(parseDoc(snap.data()), change, Date.now());
      if (!result) return undefined;
      tx.set(ref, result.doc);
      return result.scheduleAt;
    });
    if (scheduleAt === undefined) return;

    try {
      await getFunctions()
        .taskQueue<{ listId: string }>(`locations/${REGION}/functions/${SEND_TASK}`)
        .enqueue(
          { listId },
          {
            scheduleTime: new Date(scheduleAt),
            // A retried trigger queues the same task, not a second one.
            id: `${listId}-${scheduleAt}`,
          },
        );
    } catch (e) {
      if ((e as { code?: string }).code === "functions/task-already-exists") return;
      throw e;
    }
  },
);

export const sendListUpdates = onTaskDispatched<{ listId: string }>(
  {
    region: REGION,
    retryConfig: { maxAttempts: 3, minBackoffSeconds: 10 },
    rateLimits: { maxConcurrentDispatches: 20 },
  },
  async (req) => {
    const listId = req.data.listId;
    const notificationRef = db.doc(`notifications/${listId}`);
    const listRef = db.doc(`lists/${listId}`);

    const result = await db.runTransaction(async (tx) => {
      const [snap, listSnap] = await Promise.all([tx.get(notificationRef), tx.get(listRef)]);
      if (!listSnap.exists) {
        tx.delete(notificationRef);
        return null;
      }
      const list = listSnap.data()!;
      const members: string[] = Array.isArray(list.members) ? list.members : [];
      const flushed = flush(parseDoc(snap.data()), members);
      tx.set(notificationRef, flushed.doc);
      return {
        listName: typeof list.name === "string" ? list.name : "",
        recipients: flushed.notify.map((uid) => ({ uid, unseen: flushed.doc.unseen[uid] })),
      };
    });
    if (!result || result.recipients.length === 0) return;

    const names = await actorNames(result.recipients.flatMap((r) => r.unseen.by));
    await Promise.all(
      result.recipients.map((r) => pushTo(r.uid, listId, result.listName, r.unseen, names)),
    );
  },
);

/** First names of the given users; guests without a name are left out. */
async function actorNames(uids: string[]): Promise<Map<string, string>> {
  const unique = [...new Set(uids)];
  const names = new Map<string, string>();
  if (!unique.length) return names;
  try {
    const { users } = await getAuth().getUsers(unique.map((uid) => ({ uid })));
    for (const u of users) {
      const first = u.displayName?.trim().split(/\s+/)[0];
      if (first) names.set(u.uid, first);
    }
  } catch (e) {
    logger.warn("Couldn't read user names", e);
  }
  return names;
}

async function pushTo(
  uid: string,
  listId: string,
  listName: string,
  unseen: Unseen,
  names: Map<string, string>,
) {
  const devices = await db.collection(`users/${uid}/devices`).get();
  if (devices.empty) return;

  const actors = unseen.by.map((id) => names.get(id)).filter((n): n is string => !!n);
  const messages: Message[] = devices.docs.map((d) => {
    const { title, body } = buildNotification(listName, unseen, actors, d.get("locale"));
    return message(d.id, listId, title, body);
  });

  const response = await getMessaging().sendEach(messages);
  const stale = response.responses
    .map((r, i) => ({ r, doc: devices.docs[i] }))
    .filter(({ r }) => {
      const code = r.error?.code;
      return (
        code === "messaging/installation-id-not-registered" ||
        code === "messaging/registration-token-not-registered" ||
        code === "messaging/invalid-argument"
      );
    });
  await Promise.all(stale.map(({ doc }) => doc.ref.delete()));
  const errors = response.responses
    .map((r, i) => ({ r, doc: devices.docs[i] }))
    .filter(({ r, doc }) => r.error && !stale.some((s) => s.doc.id === doc.id))
    .map(({ r, doc }) => ({
      platform: doc.get("platform"),
      code: r.error?.code,
      message: r.error?.message,
    }));
  if (errors.length) logger.warn(`Pushes for list ${listId} failed`, { errors });
  if (stale.length) logger.info(`Removed ${stale.length} stale devices`);
}

/**
 * One push for one device (keyed by its Firebase Installation ID). The list
 * id is the tag on every platform, so a newer push for the same list
 * replaces the shown one, and `data.listId` tells the app which list to open.
 */
function message(fid: string, listId: string, title: string, body: string): Message {
  return {
    fid,
    notification: { title, body },
    data: { type: "listUpdates", listId },
    android: {
      collapseKey: listId,
      priority: "high",
      notification: { tag: listId },
    },
    apns: {
      headers: { "apns-collapse-id": listId, "apns-priority": "10" },
      payload: { aps: { sound: "default", threadId: listId } },
    },
    webpush: {
      headers: { Topic: listId, Urgency: "high" },
      notification: {
        tag: listId,
        renotify: true,
        icon: `${WEB_APP}/icons/Icon-192.png`,
      },
      fcmOptions: { link: `${WEB_APP}/?openList=${encodeURIComponent(listId)}` },
    },
  };
}
