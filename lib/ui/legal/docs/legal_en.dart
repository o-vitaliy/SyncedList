part of '../legal_content.dart';

const _privacyEn = LegalDoc(
  title: 'Privacy Policy',
  effective: 'Effective November 21, 2026',
  sections: [
    LegalSection(
      paragraphs: [
        'SyncedList is a free app for shared shopping lists, made by ovitaliy and available on Android, iOS and the web at syncedlist.web.app. This policy explains what data the app handles, why, and who it is shared with. By using SyncedList you agree to it.',
      ],
    ),
    LegalSection(
      heading: 'What we collect',
      bullets: [
        LegalBullet(
          'Account details.',
          'If you sign in with Google or Facebook, we receive your name, email address and profile photo from that provider. If you continue without an account, we create an anonymous account with a random ID and no personal details.',
        ),
        LegalBullet(
          'Your lists.',
          'List names and items, their order and whether they are checked off, and which accounts are members of each list.',
        ),
        LegalBullet(
          'Crash reports.',
          'When the app crashes or hits an error, it sends a report with details such as the device model, operating system version, app version and the state of the app at the time.',
        ),
        LegalBullet(
          'Settings on your device.',
          'Your theme, item sort order and any pending list invites are stored only on your device.',
        ),
      ],
    ),
    LegalSection(
      heading: 'How we use it',
      paragraphs: [
        'We use this data only to run the app: to sign you in, to store your lists and keep them in sync across your devices and with the people you share them with, and to find and fix bugs. We do not sell your data, show ads, or use it for marketing.',
      ],
    ),
    LegalSection(
      heading: 'Who can see it',
      bullets: [
        LegalBullet(
          'People you share a list with.',
          'Anyone who opens a share link for a list becomes a member and can see and edit it. Only share links with people you trust.',
        ),
        LegalBullet(
          'Service providers.',
          'SyncedList runs on Google Firebase: Firebase Authentication (sign-in), Cloud Firestore (list storage), Firebase Crashlytics (crash reports) and Firebase Hosting (the website). Signing in with Google or Facebook also goes through those companies. Each of them processes data under its own policy.',
        ),
        LegalBullet('The law.', 'We may disclose data if required to by law.'),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: 'Keeping and deleting your data',
      paragraphs: [
        'Your data is kept while you use the app. Deleting a list in the app removes you from it, and the list is deleted completely once no members are left. To have your account and all its data deleted, email us at the address below and we will do it within 30 days.',
      ],
    ),
    LegalSection(
      heading: 'Cookies',
      paragraphs: [
        'The website stores small pieces of data in your browser (local storage and, for sign-in, cookies set by Firebase, Google or Facebook) to keep you signed in and remember your settings. They are not used for tracking or advertising.',
      ],
    ),
    LegalSection(
      heading: 'Security',
      paragraphs: [
        "Data is sent over encrypted connections and stored on Google's servers. No method of storage or transmission is completely secure, so we cannot guarantee absolute security.",
      ],
    ),
    LegalSection(
      heading: 'Children',
      paragraphs: [
        'SyncedList is not directed at children under 13, and we do not knowingly collect their personal data. If you believe a child has given us personal data, contact us and we will delete it.',
      ],
    ),
    LegalSection(
      heading: 'Changes to this policy',
      paragraphs: [
        'We may update this policy from time to time. Changes are posted on this page with a new effective date.',
      ],
    ),
    LegalSection(
      heading: 'Contact',
      paragraphs: ['Questions or requests:'],
      links: [_contact],
    ),
  ],
);

const _termsEn = LegalDoc(
  title: 'Terms of Use',
  effective: 'Effective November 21, 2026',
  sections: [
    LegalSection(
      paragraphs: [
        "These terms apply when you use SyncedList, a free shared shopping list app made by ovitaliy, on Android, iOS or the web at syncedlist.web.app. By using the app you agree to them. If you don't agree, please don't use the app.",
      ],
    ),
    LegalSection(
      heading: 'Using SyncedList',
      paragraphs: [
        "You can use the app with a Google or Facebook account, or without an account. You are responsible for what you put in your lists and for keeping your device and accounts secure. Don't use the app for anything illegal, to harass others, or to interfere with the service or other people's data.",
      ],
    ),
    LegalSection(
      heading: 'Sharing lists',
      paragraphs: [
        'When you share a list, anyone who opens the link becomes a member and can view and change it. You are responsible for who you share links with. Members can leave a list at any time.',
      ],
    ),
    LegalSection(
      heading: 'Guest accounts',
      paragraphs: [
        "If you use the app without an account, your lists are tied to that device's guest session. Signing out, clearing app data or uninstalling the app can make them unrecoverable. Sign in with Google or Facebook from the account menu to keep them.",
      ],
    ),
    LegalSection(
      heading: 'Third-party services',
      paragraphs: [
        'The app relies on services with their own terms. How we handle your data is described in the Privacy Policy.',
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: 'The app itself',
      paragraphs: [
        "The app, its name and its design belong to ovitaliy. Don't copy, modify, resell or reverse-engineer it, or use its name or branding in a way that suggests a connection with us.",
      ],
    ),
    LegalSection(
      heading: 'Availability and changes',
      paragraphs: [
        'SyncedList is provided free and "as is". We work to keep it running and your lists in sync, but we can\'t promise it will always be available, error-free or compatible with your device. Some features need an internet connection, and your mobile carrier\'s data charges may apply. We may change, update or stop the app at any time.',
      ],
    ),
    LegalSection(
      heading: 'Liability',
      paragraphs: [
        'To the extent the law allows, ovitaliy is not liable for any loss or damage arising from using or being unable to use the app, including lost list data.',
      ],
    ),
    LegalSection(
      heading: 'Changes to these terms',
      paragraphs: [
        'We may update these terms from time to time. Changes are posted on this page with a new effective date, and continuing to use the app means you accept them.',
      ],
    ),
    LegalSection(
      heading: 'Contact',
      paragraphs: ['Questions:'],
      links: [_contact],
    ),
  ],
);
