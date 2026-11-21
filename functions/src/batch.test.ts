import assert from "node:assert/strict";
import { test } from "node:test";

import { applyChange, emptyDoc, flush, NotificationDoc, STALE_WINDOW_MS, toChange, WINDOW_SECONDS } from "./batch";
import { buildNotification } from "./texts";

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
  assert.deepEqual(toChange("i", { value: "Milk" }, undefined), { kind: "deleted", itemId: "i" });
  // Older app versions don't say who wrote.
  assert.equal(toChange("i", undefined, { value: "Milk", done: false }), null);
});

test("the first change opens a 30 s window, later ones join it", () => {
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

  doc = apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc;
  doc = apply(doc, { kind: "deleted", itemId: "1" }, 2).doc;
  f = flush(doc, [A, B]);
  assert.deepEqual(f.notify, []);
});

test("people who left the list are dropped", () => {
  const doc = apply(emptyDoc(), { kind: "added", itemId: "1", value: "Milk", by: A }, 1).doc;
  const f = flush({ ...doc, unseen: { gone: { added: { x: { value: "x", at: 0 } }, done: {}, by: [A] } } }, [A, B]);
  assert.deepEqual(Object.keys(f.doc.unseen), [B]);
});

test("notification text", () => {
  const unseen = {
    added: {
      a: { value: "Milk", at: 4 }, b: { value: "Bread", at: 3 },
      c: { value: "Eggs", at: 2 }, d: { value: "Tea", at: 1 },
    },
    done: { e: { value: "Butter", at: 5 } },
    by: [A],
  };
  assert.deepEqual(buildNotification("Groceries", unseen, ["Anna"], "en_US"), {
    title: "Groceries",
    body: "Anna — Added: Milk, Bread, Eggs and 1 more\nChecked off: Butter",
  });
  assert.equal(
    buildNotification("Продукты", unseen, ["Анна", "Боб"], "ru").body,
    "Анна и Боб — Добавлено: Milk, Bread, Eggs и ещё 1\nКуплено: Butter",
  );
  assert.equal(buildNotification("G", { added: {}, done: unseen.done, by: [] }, [], undefined).body, "Checked off: Butter");
});
