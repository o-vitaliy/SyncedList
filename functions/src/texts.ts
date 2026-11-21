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

type Locale =
  | "en" | "uk" | "ru" | "pl" | "de" | "es" | "pt"
  | "fr" | "it" | "tr" | "cs" | "ja" | "id" | "hi";

const strings: Record<Locale, Strings> = {
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
  ru: {
    added: "Добавлено",
    checked: "Куплено",
    more: (n) => `и ещё ${n}`,
    and: "и",
  },
  pl: {
    added: "Dodano",
    checked: "Kupiono",
    more: (n) => `i ${n} więcej`,
    and: "i",
  },
  de: {
    added: "Hinzugefügt",
    checked: "Abgehakt",
    more: (n) => `und ${n} weitere`,
    and: "und",
  },
  es: {
    added: "Añadido",
    checked: "Comprado",
    more: (n) => `y ${n} más`,
    and: "y",
  },
  pt: {
    added: "Adicionado",
    checked: "Comprado",
    more: (n) => `e mais ${n}`,
    and: "e",
  },
  fr: {
    added: "Ajouté",
    checked: "Coché",
    more: (n) => `et ${n} de plus`,
    and: "et",
  },
  it: {
    added: "Aggiunto",
    checked: "Spuntato",
    more: (n) => `e altri ${n}`,
    and: "e",
  },
  tr: {
    added: "Eklendi",
    checked: "Alındı",
    more: (n) => `ve ${n} tane daha`,
    and: "ve",
  },
  cs: {
    added: "Přidáno",
    checked: "Koupeno",
    more: (n) => `a ${n} další`,
    and: "a",
  },
  ja: {
    added: "追加",
    checked: "購入済み",
    more: (n) => `ほか${n}件`,
    and: "と",
  },
  id: {
    added: "Ditambahkan",
    checked: "Dicentang",
    more: (n) => `dan ${n} lainnya`,
    and: "dan",
  },
  hi: {
    added: "जोड़ा गया",
    checked: "ख़रीदा गया",
    more: (n) => `और ${n} अन्य`,
    and: "और",
  },
};

function isLocale(lang: string): lang is Locale {
  return Object.prototype.hasOwnProperty.call(strings, lang);
}

/** The app's language for a BCP 47 tag such as "pt-BR", or English. */
export function pickLocale(locale: string | undefined): Locale {
  const lang = locale?.toLowerCase().split(/[-_]/)[0] ?? "";
  return isLocale(lang) ? lang : "en";
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
