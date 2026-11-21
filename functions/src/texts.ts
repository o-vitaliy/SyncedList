import { SeenItem, Unseen } from "./batch";

// Notification text, in the languages the app supports (lib/l10n).

const MAX_NAMES = 3;
const MAX_NAME_LENGTH = 30;

interface Strings {
  added: string;
  checked: string;
  more: (n: number) => string;
  and: string;
}

const strings: Record<"en" | "uk", Strings> = {
  en: {
    added: "Added",
    checked: "Checked off",
    more: (n) => `and ${n} more`,
    and: "and",
  },
  uk: {
    added: "Додано",
    checked: "Куплено",
    more: (n) => `і ще ${n}`,
    and: "і",
  },
};

export function pickLocale(locale: string | undefined): "en" | "uk" {
  return locale?.toLowerCase().startsWith("uk") ? "uk" : "en";
}

/**
 * The push for one member: the list name as the title, and everything the
 * others changed since the member last opened the list as the body, e.g.
 * "Anna: Added Milk, Bread and 2 more\nChecked off Eggs".
 */
export function buildNotification(
  listName: string,
  unseen: Unseen,
  actorNames: string[],
  locale: string | undefined,
): { title: string; body: string } {
  const s = strings[pickLocale(locale)];
  const lines: string[] = [];
  const added = Object.values(unseen.added);
  const done = Object.values(unseen.done);
  if (added.length) lines.push(`${s.added}: ${summarize(added, s)}`);
  if (done.length) lines.push(`${s.checked}: ${summarize(done, s)}`);

  let body = lines.join("\n");
  if (actorNames.length) body = `${joinNames(actorNames, s)} — ${body}`;
  return { title: listName, body };
}

/** The newest items first, cut to a few names. */
function summarize(items: SeenItem[], s: Strings): string {
  const sorted = [...items].sort((a, b) => b.at - a.at);
  const shown = sorted.slice(0, MAX_NAMES).map((i) => truncate(i.value));
  const rest = sorted.length - shown.length;
  return rest > 0 ? `${shown.join(", ")} ${s.more(rest)}` : shown.join(", ");
}

function joinNames(names: string[], s: Strings): string {
  if (names.length === 1) return names[0];
  return `${names.slice(0, -1).join(", ")} ${s.and} ${names[names.length - 1]}`;
}

function truncate(value: string): string {
  const v = value.trim();
  return v.length > MAX_NAME_LENGTH ? `${v.slice(0, MAX_NAME_LENGTH - 1)}…` : v;
}
