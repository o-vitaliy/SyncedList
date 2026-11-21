part of '../legal_content.dart';

const _privacyDe = LegalDoc(
  title: "Datenschutzerklärung",
  effective: "Gültig ab 21. November 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList ist eine kostenlose App für gemeinsame Einkaufslisten von ovitaliy, verfügbar für Android, iOS und im Web unter syncedlist.web.app. Diese Erklärung beschreibt, welche Daten die App verarbeitet, wozu und an wen sie weitergegeben werden. Mit der Nutzung von SyncedList stimmst du ihr zu.",
      ],
    ),
    LegalSection(
      heading: "Welche Daten wir erheben",
      bullets: [
        LegalBullet(
          "Kontodaten.",
          "Wenn du dich mit Google oder Facebook anmeldest, erhalten wir von diesem Anbieter deinen Namen, deine E-Mail-Adresse und dein Profilbild. Wenn du ohne Konto fortfährst, legen wir ein anonymes Konto mit einer zufälligen ID und ohne persönliche Angaben an.",
        ),
        LegalBullet(
          "Deine Listen.",
          "Listennamen und Artikel, ihre Reihenfolge und ob sie abgehakt sind, sowie welche Konten Mitglied der jeweiligen Liste sind.",
        ),
        LegalBullet(
          "Absturzberichte.",
          "Wenn die App abstürzt oder auf einen Fehler stößt, sendet sie einen Bericht mit Angaben wie Gerätemodell, Version des Betriebssystems, App-Version und dem Zustand der App zu diesem Zeitpunkt.",
        ),
        LegalBullet(
          "Einstellungen auf deinem Gerät.",
          "Dein Design, die Sortierung der Artikel und offene Listeneinladungen werden nur auf deinem Gerät gespeichert.",
        ),
      ],
    ),
    LegalSection(
      heading: "Wie wir sie verwenden",
      paragraphs: [
        "Wir verwenden diese Daten nur für den Betrieb der App: um dich anzumelden, um deine Listen zu speichern und zwischen deinen Geräten und mit den Personen, mit denen du sie teilst, zu synchronisieren, und um Fehler zu finden und zu beheben. Wir verkaufen deine Daten nicht, zeigen keine Werbung und nutzen sie nicht für Marketing.",
      ],
    ),
    LegalSection(
      heading: "Wer sie sehen kann",
      bullets: [
        LegalBullet(
          "Personen, mit denen du eine Liste teilst.",
          "Wer einen Freigabelink für eine Liste öffnet, wird Mitglied und kann sie sehen und bearbeiten. Teile Links nur mit Personen, denen du vertraust.",
        ),
        LegalBullet(
          "Dienstleister.",
          "SyncedList läuft auf Google Firebase: Firebase Authentication (Anmeldung), Cloud Firestore (Speicherung der Listen), Firebase Crashlytics (Absturzberichte) und Firebase Hosting (die Website). Die Anmeldung mit Google oder Facebook läuft ebenfalls über diese Unternehmen. Jedes von ihnen verarbeitet Daten nach seinen eigenen Richtlinien.",
        ),
        LegalBullet(
          "Gesetzliche Pflichten.",
          "Wir können Daten offenlegen, wenn das Gesetz es verlangt.",
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Speicherung und Löschung deiner Daten",
      paragraphs: [
        "Deine Daten werden gespeichert, solange du die App nutzt. Wenn du eine Liste in der App löschst, wirst du als Mitglied entfernt; die Liste selbst wird vollständig gelöscht, sobald keine Mitglieder mehr übrig sind. Wenn dein Konto und alle zugehörigen Daten gelöscht werden sollen, schreib uns an die unten stehende Adresse, und wir erledigen das innerhalb von 30 Tagen.",
      ],
    ),
    LegalSection(
      heading: "Cookies",
      paragraphs: [
        "Die Website speichert kleine Datenmengen in deinem Browser (Local Storage und, für die Anmeldung, Cookies von Firebase, Google oder Facebook), damit du angemeldet bleibst und deine Einstellungen erhalten bleiben. Sie werden nicht für Tracking oder Werbung verwendet.",
      ],
    ),
    LegalSection(
      heading: "Sicherheit",
      paragraphs: [
        "Daten werden über verschlüsselte Verbindungen übertragen und auf Servern von Google gespeichert. Keine Methode der Speicherung oder Übertragung ist vollkommen sicher, daher können wir keine absolute Sicherheit garantieren.",
      ],
    ),
    LegalSection(
      heading: "Kinder",
      paragraphs: [
        "SyncedList richtet sich nicht an Kinder unter 13 Jahren, und wir erheben wissentlich keine personenbezogenen Daten von ihnen. Wenn du glaubst, dass ein Kind uns personenbezogene Daten übermittelt hat, kontaktiere uns, und wir löschen sie.",
      ],
    ),
    LegalSection(
      heading: "Änderungen dieser Erklärung",
      paragraphs: [
        "Wir können diese Erklärung von Zeit zu Zeit aktualisieren. Änderungen werden auf dieser Seite mit einem neuen Gültigkeitsdatum veröffentlicht.",
      ],
    ),
    LegalSection(
      heading: "Kontakt",
      paragraphs: ["Fragen oder Anliegen:"],
      links: [_contact],
    ),
  ],
);

const _termsDe = LegalDoc(
  title: "Nutzungsbedingungen",
  effective: "Gültig ab 21. November 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Diese Bedingungen gelten, wenn du SyncedList, eine kostenlose App für gemeinsame Einkaufslisten von ovitaliy, auf Android, iOS oder im Web unter syncedlist.web.app nutzt. Mit der Nutzung der App stimmst du ihnen zu. Wenn du nicht einverstanden bist, nutze die App bitte nicht.",
      ],
    ),
    LegalSection(
      heading: "Nutzung von SyncedList",
      paragraphs: [
        "Du kannst die App mit einem Google- oder Facebook-Konto oder ohne Konto nutzen. Du bist für die Inhalte deiner Listen und für die Sicherheit deines Geräts und deiner Konten verantwortlich. Nutze die App nicht für rechtswidrige Zwecke, um andere zu belästigen oder um den Dienst oder die Daten anderer zu beeinträchtigen.",
      ],
    ),
    LegalSection(
      heading: "Listen teilen",
      paragraphs: [
        "Wenn du eine Liste teilst, wird jede Person, die den Link öffnet, Mitglied und kann sie ansehen und ändern. Du bist dafür verantwortlich, mit wem du Links teilst. Mitglieder können eine Liste jederzeit verlassen.",
      ],
    ),
    LegalSection(
      heading: "Gastkonten",
      paragraphs: [
        "Wenn du die App ohne Konto nutzt, sind deine Listen an die Gastsitzung auf diesem Gerät gebunden. Durch Abmelden, Löschen der App-Daten oder Deinstallieren der App können sie unwiederbringlich verloren gehen. Melde dich im Kontomenü mit Google oder Facebook an, um sie zu behalten.",
      ],
    ),
    LegalSection(
      heading: "Dienste Dritter",
      paragraphs: [
        "Die App nutzt Dienste mit eigenen Bedingungen. Wie wir mit deinen Daten umgehen, beschreibt die Datenschutzerklärung.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "Die App selbst",
      paragraphs: [
        "Die App, ihr Name und ihr Design gehören ovitaliy. Kopiere, verändere, verkaufe oder dekompiliere sie nicht und verwende ihren Namen oder ihr Branding nicht so, dass eine Verbindung zu uns nahegelegt wird.",
      ],
    ),
    LegalSection(
      heading: "Verfügbarkeit und Änderungen",
      paragraphs: [
        "SyncedList wird kostenlos und „wie besehen“ bereitgestellt. Wir sorgen dafür, dass die App läuft und deine Listen synchron bleiben, können aber nicht versprechen, dass sie immer verfügbar, fehlerfrei oder mit deinem Gerät kompatibel ist. Manche Funktionen brauchen eine Internetverbindung, und dein Mobilfunkanbieter kann Gebühren für Datenverkehr berechnen. Wir können die App jederzeit ändern, aktualisieren oder einstellen.",
      ],
    ),
    LegalSection(
      heading: "Haftung",
      paragraphs: [
        "Soweit gesetzlich zulässig, haftet ovitaliy nicht für Verluste oder Schäden, die aus der Nutzung oder der Unmöglichkeit der Nutzung der App entstehen, einschließlich verlorener Listendaten.",
      ],
    ),
    LegalSection(
      heading: "Änderungen dieser Bedingungen",
      paragraphs: [
        "Wir können diese Bedingungen von Zeit zu Zeit aktualisieren. Änderungen werden auf dieser Seite mit einem neuen Gültigkeitsdatum veröffentlicht, und wenn du die App weiter nutzt, akzeptierst du sie.",
      ],
    ),
    LegalSection(
      heading: "Kontakt",
      paragraphs: ["Fragen:"],
      links: [_contact],
    ),
  ],
);
