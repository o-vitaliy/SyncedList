part of '../legal_content.dart';

const _privacyCs = LegalDoc(
  title: "Zásady ochrany osobních údajů",
  effective: "Platné od 21. listopadu 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList je bezplatná aplikace pro sdílené nákupní seznamy od ovitaliy, dostupná pro Android, iOS a na webu na adrese syncedlist.web.app. Tyto zásady vysvětlují, jaké údaje aplikace zpracovává, proč a s kým je sdílí. Používáním SyncedList s nimi souhlasíte.",
      ],
    ),
    LegalSection(
      heading: "Jaké údaje shromažďujeme",
      bullets: [
        LegalBullet(
          "Údaje o účtu.",
          "Pokud se přihlásíte přes Google nebo Facebook, dostaneme od tohoto poskytovatele vaše jméno, e-mailovou adresu a profilovou fotku. Pokud pokračujete bez účtu, vytvoříme anonymní účet s náhodným ID a bez osobních údajů.",
        ),
        LegalBullet(
          "Vaše seznamy.",
          "Názvy seznamů a položky, jejich pořadí a zda jsou odškrtnuté, a také které účty jsou členy jednotlivých seznamů.",
        ),
        LegalBullet(
          "Hlášení o pádech.",
          "Když aplikace spadne nebo narazí na chybu, odešle hlášení s údaji, jako je model zařízení, verze operačního systému, verze aplikace a její stav v daném okamžiku.",
        ),
        LegalBullet(
          "Nastavení ve vašem zařízení.",
          "Motiv, řazení položek a čekající pozvánky do seznamů se ukládají pouze ve vašem zařízení.",
        ),
      ],
    ),
    LegalSection(
      heading: "Jak je používáme",
      paragraphs: [
        "Tyto údaje používáme jen k provozu aplikace: k vašemu přihlášení, k ukládání seznamů a jejich synchronizaci mezi vašimi zařízeními a s lidmi, se kterými je sdílíte, a k hledání a opravám chyb. Vaše údaje neprodáváme, nezobrazujeme reklamy a nepoužíváme je k marketingu.",
      ],
    ),
    LegalSection(
      heading: "Kdo je vidí",
      bullets: [
        LegalBullet(
          "Lidé, se kterými sdílíte seznam.",
          "Kdokoli otevře odkaz na seznam, stane se jeho členem a může ho zobrazit a upravovat. Odkazy sdílejte jen s lidmi, kterým důvěřujete.",
        ),
        LegalBullet(
          "Poskytovatelé služeb.",
          "SyncedList běží na Google Firebase: Firebase Authentication (přihlášení), Cloud Firestore (ukládání seznamů), Firebase Crashlytics (hlášení o pádech) a Firebase Hosting (web). Přihlášení přes Google nebo Facebook probíhá také přes tyto společnosti. Každá z nich zpracovává údaje podle vlastních zásad.",
        ),
        LegalBullet(
          "Zákon.",
          "Údaje můžeme zpřístupnit, pokud to vyžaduje zákon.",
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Uchovávání a mazání údajů",
      paragraphs: [
        "Vaše údaje uchováváme, dokud aplikaci používáte. Smazáním seznamu v aplikaci se z něj odeberete; samotný seznam se úplně smaže, jakmile v něm nezůstane žádný člen. Pokud chcete smazat svůj účet a všechny jeho údaje, napište nám na adresu níže a uděláme to do 30 dnů.",
      ],
    ),
    LegalSection(
      heading: "Cookies",
      paragraphs: [
        "Web ukládá ve vašem prohlížeči malé množství dat (local storage a pro přihlášení cookies od Firebase, Google nebo Facebooku), abyste zůstali přihlášeni a vaše nastavení se zachovalo. Nepoužívají se ke sledování ani reklamě.",
      ],
    ),
    LegalSection(
      heading: "Zabezpečení",
      paragraphs: [
        "Údaje se přenášejí šifrovaným spojením a ukládají se na serverech Google. Žádný způsob ukládání ani přenosu není zcela bezpečný, proto nemůžeme zaručit absolutní bezpečnost.",
      ],
    ),
    LegalSection(
      heading: "Děti",
      paragraphs: [
        "SyncedList není určen dětem mladším 13 let a jejich osobní údaje vědomě neshromažďujeme. Pokud se domníváte, že nám dítě poskytlo osobní údaje, kontaktujte nás a my je smažeme.",
      ],
    ),
    LegalSection(
      heading: "Změny těchto zásad",
      paragraphs: [
        "Tyto zásady můžeme čas od času aktualizovat. Změny zveřejňujeme na této stránce s novým datem účinnosti.",
      ],
    ),
    LegalSection(
      heading: "Kontakt",
      paragraphs: ["Dotazy a žádosti:"],
      links: [_contact],
    ),
  ],
);

const _termsCs = LegalDoc(
  title: "Podmínky použití",
  effective: "Platné od 21. listopadu 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Tyto podmínky platí, když používáte SyncedList – bezplatnou aplikaci pro sdílené nákupní seznamy od ovitaliy – na Androidu, iOS nebo na webu na adrese syncedlist.web.app. Používáním aplikace s nimi souhlasíte. Pokud nesouhlasíte, aplikaci prosím nepoužívejte.",
      ],
    ),
    LegalSection(
      heading: "Používání SyncedList",
      paragraphs: [
        "Aplikaci můžete používat s účtem Google nebo Facebook, nebo bez účtu. Odpovídáte za to, co do seznamů vkládáte, a za zabezpečení svého zařízení a účtů. Nepoužívejte aplikaci k nezákonným účelům, k obtěžování ostatních ani k narušování služby nebo cizích dat.",
      ],
    ),
    LegalSection(
      heading: "Sdílení seznamů",
      paragraphs: [
        "Když seznam sdílíte, každý, kdo otevře odkaz, se stane členem a může seznam zobrazit a měnit. Odpovídáte za to, s kým odkazy sdílíte. Členové mohou seznam kdykoli opustit.",
      ],
    ),
    LegalSection(
      heading: "Účty hosta",
      paragraphs: [
        "Pokud používáte aplikaci bez účtu, vaše seznamy jsou vázané na relaci hosta v tomto zařízení. Odhlášení, vymazání dat aplikace nebo její odinstalování může způsobit, že je už nepůjde obnovit. Abyste si je zachovali, přihlaste se v nabídce účtu přes Google nebo Facebook.",
      ],
    ),
    LegalSection(
      heading: "Služby třetích stran",
      paragraphs: [
        "Aplikace využívá služby s vlastními podmínkami. Jak zacházíme s vašimi údaji, popisují Zásady ochrany osobních údajů.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "Práva k aplikaci",
      paragraphs: [
        "Aplikace, její název a design patří ovitaliy. Nekopírujte ji, neupravujte, nepřeprodávejte ani nedekompilujte a nepoužívejte její název nebo značku způsobem, který by naznačoval spojení s námi.",
      ],
    ),
    LegalSection(
      heading: "Dostupnost a změny",
      paragraphs: [
        "SyncedList poskytujeme zdarma a „tak, jak je“. Snažíme se, aby fungoval a vaše seznamy byly synchronizované, ale nemůžeme slíbit, že bude vždy dostupný, bez chyb nebo kompatibilní s vaším zařízením. Některé funkce potřebují připojení k internetu a váš operátor může účtovat poplatky za data. Aplikaci můžeme kdykoli změnit, aktualizovat nebo ukončit.",
      ],
    ),
    LegalSection(
      heading: "Odpovědnost",
      paragraphs: [
        "V rozsahu, který zákon dovoluje, neodpovídá ovitaliy za žádné ztráty ani škody vzniklé používáním aplikace nebo nemožností ji používat, včetně ztráty dat seznamů.",
      ],
    ),
    LegalSection(
      heading: "Změny těchto podmínek",
      paragraphs: [
        "Tyto podmínky můžeme čas od času aktualizovat. Změny zveřejňujeme na této stránce s novým datem účinnosti a dalším používáním aplikace s nimi souhlasíte.",
      ],
    ),
    LegalSection(
      heading: "Kontakt",
      paragraphs: ["Dotazy:"],
      links: [_contact],
    ),
  ],
);
