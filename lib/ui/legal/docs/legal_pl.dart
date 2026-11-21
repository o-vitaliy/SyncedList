part of '../legal_content.dart';

const _privacyPl = LegalDoc(
  title: "Polityka prywatności",
  effective: "Obowiązuje od 21 listopada 2026 r.",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList to bezpłatna aplikacja do wspólnych list zakupów stworzona przez ovitaliy, dostępna na Androida, iOS i w przeglądarce pod adresem syncedlist.web.app. Ta polityka wyjaśnia, jakie dane przetwarza aplikacja, w jakim celu i komu są one udostępniane. Korzystając z SyncedList, akceptujesz ją.",
      ],
    ),
    LegalSection(
      heading: "Jakie dane zbieramy",
      bullets: [
        LegalBullet(
          "Dane konta.",
          "Jeśli logujesz się przez Google lub Facebooka, otrzymujemy od tego dostawcy Twoje imię i nazwisko, adres e-mail oraz zdjęcie profilowe. Jeśli korzystasz z aplikacji bez konta, tworzymy anonimowe konto z losowym identyfikatorem i bez danych osobowych.",
        ),
        LegalBullet(
          "Twoje listy.",
          "Nazwy list i produkty, ich kolejność i to, czy zostały odhaczone, a także konta, które są członkami każdej listy.",
        ),
        LegalBullet(
          "Raporty o awariach.",
          "Gdy aplikacja ulegnie awarii lub napotka błąd, wysyła raport zawierający m.in. model urządzenia, wersję systemu operacyjnego, wersję aplikacji i jej stan w tym momencie.",
        ),
        LegalBullet(
          "Ustawienia na urządzeniu.",
          "Motyw, kolejność sortowania produktów i oczekujące zaproszenia do list są przechowywane wyłącznie na Twoim urządzeniu.",
        ),
      ],
    ),
    LegalSection(
      heading: "Jak je wykorzystujemy",
      paragraphs: [
        "Używamy tych danych wyłącznie do działania aplikacji: aby Cię zalogować, przechowywać Twoje listy i synchronizować je między Twoimi urządzeniami oraz z osobami, którym je udostępniasz, a także aby znajdować i naprawiać błędy. Nie sprzedajemy Twoich danych, nie wyświetlamy reklam i nie wykorzystujemy danych do celów marketingowych.",
      ],
    ),
    LegalSection(
      heading: "Kto je widzi",
      bullets: [
        LegalBullet(
          "Osoby, którym udostępniasz listę.",
          "Każdy, kto otworzy link do listy, staje się jej członkiem i może ją przeglądać oraz edytować. Udostępniaj linki tylko osobom, którym ufasz.",
        ),
        LegalBullet(
          "Dostawcy usług.",
          "SyncedList działa na Google Firebase: Firebase Authentication (logowanie), Cloud Firestore (przechowywanie list), Firebase Crashlytics (raporty o awariach) i Firebase Hosting (strona internetowa). Logowanie przez Google lub Facebooka również odbywa się za pośrednictwem tych firm. Każda z nich przetwarza dane zgodnie z własną polityką.",
        ),
        LegalBullet("Prawo.", "Możemy ujawnić dane, jeśli wymaga tego prawo."),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Przechowywanie i usuwanie danych",
      paragraphs: [
        "Twoje dane są przechowywane, dopóki korzystasz z aplikacji. Usunięcie listy w aplikacji usuwa Cię z jej członków, a sama lista jest całkowicie usuwana, gdy nie zostanie w niej żaden członek. Aby usunąć konto i wszystkie jego dane, napisz do nas na adres poniżej — zrobimy to w ciągu 30 dni.",
      ],
    ),
    LegalSection(
      heading: "Pliki cookie",
      paragraphs: [
        "Strona przechowuje w Twojej przeglądarce niewielkie ilości danych (local storage oraz, przy logowaniu, pliki cookie ustawiane przez Firebase, Google lub Facebooka), aby utrzymać Cię zalogowanym i zapamiętać ustawienia. Nie służą one do śledzenia ani reklamy.",
      ],
    ),
    LegalSection(
      heading: "Bezpieczeństwo",
      paragraphs: [
        "Dane są przesyłane szyfrowanymi połączeniami i przechowywane na serwerach Google. Żadna metoda przechowywania ani przesyłania nie jest w pełni bezpieczna, dlatego nie możemy zagwarantować całkowitego bezpieczeństwa.",
      ],
    ),
    LegalSection(
      heading: "Dzieci",
      paragraphs: [
        "SyncedList nie jest przeznaczony dla dzieci poniżej 13 roku życia i świadomie nie zbieramy ich danych osobowych. Jeśli uważasz, że dziecko przekazało nam dane osobowe, skontaktuj się z nami, a je usuniemy.",
      ],
    ),
    LegalSection(
      heading: "Zmiany tej polityki",
      paragraphs: [
        "Możemy od czasu do czasu aktualizować tę politykę. Zmiany publikujemy na tej stronie z nową datą obowiązywania.",
      ],
    ),
    LegalSection(
      heading: "Kontakt",
      paragraphs: ["Pytania i prośby:"],
      links: [_contact],
    ),
  ],
);

const _termsPl = LegalDoc(
  title: "Warunki korzystania",
  effective: "Obowiązują od 21 listopada 2026 r.",
  sections: [
    LegalSection(
      paragraphs: [
        "Te warunki obowiązują, gdy korzystasz z SyncedList — bezpłatnej aplikacji do wspólnych list zakupów stworzonej przez ovitaliy — na Androidzie, iOS lub w przeglądarce pod adresem syncedlist.web.app. Korzystając z aplikacji, akceptujesz je. Jeśli się z nimi nie zgadzasz, nie korzystaj z aplikacji.",
      ],
    ),
    LegalSection(
      heading: "Korzystanie z SyncedList",
      paragraphs: [
        "Z aplikacji możesz korzystać z kontem Google lub Facebook albo bez konta. Odpowiadasz za to, co umieszczasz na swoich listach, oraz za bezpieczeństwo swojego urządzenia i kont. Nie używaj aplikacji do celów niezgodnych z prawem, do nękania innych ani do zakłócania działania usługi lub cudzych danych.",
      ],
    ),
    LegalSection(
      heading: "Udostępnianie list",
      paragraphs: [
        "Gdy udostępniasz listę, każdy, kto otworzy link, staje się jej członkiem i może ją przeglądać oraz zmieniać. Odpowiadasz za to, komu udostępniasz linki. Członkowie mogą w każdej chwili opuścić listę.",
      ],
    ),
    LegalSection(
      heading: "Konta gościa",
      paragraphs: [
        "Jeśli korzystasz z aplikacji bez konta, Twoje listy są powiązane z sesją gościa na tym urządzeniu. Wylogowanie, wyczyszczenie danych aplikacji lub jej odinstalowanie może sprawić, że nie da się ich odzyskać. Aby je zachować, zaloguj się przez Google lub Facebooka w menu konta.",
      ],
    ),
    LegalSection(
      heading: "Usługi zewnętrzne",
      paragraphs: [
        "Aplikacja korzysta z usług, które mają własne warunki. Sposób, w jaki postępujemy z Twoimi danymi, opisuje Polityka prywatności.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "Prawa do aplikacji",
      paragraphs: [
        "Aplikacja, jej nazwa i wygląd należą do ovitaliy. Nie kopiuj, nie modyfikuj, nie odsprzedawaj ani nie dekompiluj aplikacji i nie używaj jej nazwy ani oznaczeń w sposób sugerujący związek z nami.",
      ],
    ),
    LegalSection(
      heading: "Dostępność i zmiany",
      paragraphs: [
        "SyncedList jest udostępniany bezpłatnie i „w stanie, w jakim jest”. Dbamy o to, aby działał, a Twoje listy były zsynchronizowane, ale nie możemy obiecać, że zawsze będzie dostępny, wolny od błędów lub zgodny z Twoim urządzeniem. Niektóre funkcje wymagają połączenia z internetem, a operator może naliczać opłaty za transfer danych. Możemy w każdej chwili zmienić, zaktualizować lub wycofać aplikację.",
      ],
    ),
    LegalSection(
      heading: "Odpowiedzialność",
      paragraphs: [
        "W zakresie dopuszczalnym przez prawo ovitaliy nie ponosi odpowiedzialności za jakiekolwiek straty lub szkody wynikające z korzystania lub niemożności korzystania z aplikacji, w tym za utratę danych list.",
      ],
    ),
    LegalSection(
      heading: "Zmiany warunków",
      paragraphs: [
        "Możemy od czasu do czasu aktualizować te warunki. Zmiany publikujemy na tej stronie z nową datą obowiązywania, a dalsze korzystanie z aplikacji oznacza ich akceptację.",
      ],
    ),
    LegalSection(
      heading: "Kontakt",
      paragraphs: ["Pytania:"],
      links: [_contact],
    ),
  ],
);
