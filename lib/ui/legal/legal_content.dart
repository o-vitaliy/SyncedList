// Text of the in-app Terms of Use and Privacy Policy screens.
//
// The same documents are published as web/terms.html and web/privacy.html
// (served at syncedlist.web.app/terms and /privacy for store listings and
// crawlers, which can't read a Flutter page). Keep both copies in sync.

const _email = 'ovitaliy.rudenko@gmail.com';

class LegalLink {
  final String label;
  final String url;

  const LegalLink(this.label, this.url);
}

class LegalBullet {
  /// Bold lead-in, e.g. "Account details."
  final String? lead;
  final String text;

  const LegalBullet(this.lead, this.text);
}

class LegalSection {
  final String? heading;
  final List<String> paragraphs;
  final List<LegalBullet> bullets;
  final List<LegalLink> links;

  const LegalSection({
    this.heading,
    this.paragraphs = const [],
    this.bullets = const [],
    this.links = const [],
  });
}

class LegalDoc {
  final String title;
  final String effective;
  final List<LegalSection> sections;

  const LegalDoc({
    required this.title,
    required this.effective,
    required this.sections,
  });
}

enum LegalDocType { terms, privacy }

LegalDoc legalDoc(LegalDocType type, String languageCode) {
  final uk = languageCode == 'uk';
  return switch (type) {
    LegalDocType.terms => uk ? _termsUk : _termsEn,
    LegalDocType.privacy => uk ? _privacyUk : _privacyEn,
  };
}

const _contact = LegalLink(_email, 'mailto:$_email');

const _firebasePrivacy = LegalLink(
  'Firebase',
  'https://firebase.google.com/support/privacy',
);
const _googlePrivacy = LegalLink(
  'Google',
  'https://policies.google.com/privacy',
);
const _facebookPrivacy = LegalLink(
  'Facebook',
  'https://www.facebook.com/privacy/policy/',
);
const _firebaseTerms = LegalLink(
  'Firebase',
  'https://firebase.google.com/terms',
);
const _googleTerms = LegalLink('Google', 'https://policies.google.com/terms');
const _facebookTerms = LegalLink(
  'Facebook',
  'https://www.facebook.com/legal/terms',
);

// --- Privacy Policy ---------------------------------------------------------

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

const _privacyUk = LegalDoc(
  title: 'Політика конфіденційності',
  effective: 'Діє з 21 листопада 2026 р.',
  sections: [
    LegalSection(
      paragraphs: [
        'SyncedList — безкоштовний застосунок для спільних списків покупок від ovitaliy. Він доступний на Android, iOS і в браузері на syncedlist.web.app. Ця політика пояснює, які дані обробляє застосунок, навіщо і кому вони передаються. Користуючись SyncedList, ви погоджуєтеся з нею.',
      ],
    ),
    LegalSection(
      heading: 'Які дані ми збираємо',
      bullets: [
        LegalBullet(
          'Дані акаунта.',
          'Якщо ви входите через Google або Facebook, ми отримуємо від них ваше ім\'я, адресу електронної пошти та фото профілю. Якщо ви продовжуєте без акаунта, ми створюємо анонімний акаунт із випадковим ID і без особистих даних.',
        ),
        LegalBullet(
          'Ваші списки.',
          'Назви списків і товари, їхній порядок, позначки про покупку, а також які акаунти є учасниками кожного списку.',
        ),
        LegalBullet(
          'Звіти про збої.',
          'Якщо застосунок аварійно завершує роботу або натрапляє на помилку, він надсилає звіт із такими відомостями, як модель пристрою, версія операційної системи, версія застосунку та його стан на момент збою.',
        ),
        LegalBullet(
          'Налаштування на пристрої.',
          'Тема, порядок сортування товарів і запрошення до списків, що очікують, зберігаються лише на вашому пристрої.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Як ми їх використовуємо',
      paragraphs: [
        'Ми використовуємо ці дані лише для роботи застосунку: щоб ви могли увійти, щоб зберігати ваші списки й синхронізувати їх між вашими пристроями та з тими, з ким ви ними поділилися, а також щоб знаходити й виправляти помилки. Ми не продаємо ваші дані, не показуємо рекламу і не використовуємо дані для маркетингу.',
      ],
    ),
    LegalSection(
      heading: 'Хто їх бачить',
      bullets: [
        LegalBullet(
          'Ті, з ким ви поділилися списком.',
          'Будь-хто, хто відкриває посилання на список, стає його учасником і може переглядати та змінювати його. Діліться посиланнями лише з тими, кому довіряєте.',
        ),
        LegalBullet(
          'Постачальники послуг.',
          'SyncedList працює на Google Firebase: Firebase Authentication (вхід), Cloud Firestore (зберігання списків), Firebase Crashlytics (звіти про збої) і Firebase Hosting (сайт). Вхід через Google або Facebook також відбувається через ці компанії. Кожна з них обробляє дані за власною політикою.',
        ),
        LegalBullet(
          'Закон.',
          'Ми можемо розкрити дані, якщо цього вимагає закон.',
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: 'Зберігання та видалення даних',
      paragraphs: [
        'Дані зберігаються, поки ви користуєтеся застосунком. Видалення списку в застосунку прибирає вас з учасників, а сам список видаляється повністю, коли в ньому не залишається учасників. Щоб видалити акаунт і всі його дані, напишіть нам на адресу нижче — ми зробимо це протягом 30 днів.',
      ],
    ),
    LegalSection(
      heading: 'Файли cookie',
      paragraphs: [
        'Сайт зберігає невеликі дані у вашому браузері (local storage і, для входу, cookie від Firebase, Google або Facebook), щоб ви залишалися в акаунті, а ваші налаштування зберігалися. Вони не використовуються для відстеження чи реклами.',
      ],
    ),
    LegalSection(
      heading: 'Безпека',
      paragraphs: [
        'Дані передаються зашифрованими з\'єднаннями та зберігаються на серверах Google. Жоден спосіб зберігання чи передавання не захищений повністю, тому ми не можемо гарантувати абсолютну безпеку.',
      ],
    ),
    LegalSection(
      heading: 'Діти',
      paragraphs: [
        'SyncedList не призначений для дітей віком до 13 років, і ми свідомо не збираємо їхніх особистих даних. Якщо ви вважаєте, що дитина передала нам особисті дані, зв\'яжіться з нами, і ми їх видалимо.',
      ],
    ),
    LegalSection(
      heading: 'Зміни політики',
      paragraphs: [
        'Ми можемо час від часу оновлювати цю політику. Зміни публікуються на цій сторінці з новою датою набрання чинності.',
      ],
    ),
    LegalSection(
      heading: 'Контакти',
      paragraphs: ['Запитання та запити:'],
      links: [_contact],
    ),
  ],
);

// --- Terms of Use -----------------------------------------------------------

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

const _termsUk = LegalDoc(
  title: 'Умови використання',
  effective: 'Діють з 21 листопада 2026 р.',
  sections: [
    LegalSection(
      paragraphs: [
        'Ці умови діють, коли ви користуєтеся SyncedList — безкоштовним застосунком для спільних списків покупок від ovitaliy — на Android, iOS або в браузері на syncedlist.web.app. Користуючись застосунком, ви погоджуєтеся з ними. Якщо ви не згодні, будь ласка, не користуйтеся застосунком.',
      ],
    ),
    LegalSection(
      heading: 'Користування SyncedList',
      paragraphs: [
        'Користуватися застосунком можна з акаунтом Google або Facebook чи без акаунта. Ви відповідаєте за вміст своїх списків і за безпеку свого пристрою та акаунтів. Не використовуйте застосунок для незаконних цілей, переслідування інших людей або втручання в роботу сервісу й чужі дані.',
      ],
    ),
    LegalSection(
      heading: 'Спільні списки',
      paragraphs: [
        'Коли ви ділитеся списком, будь-хто, хто відкриє посилання, стає учасником і може переглядати та змінювати його. Ви відповідаєте за те, з ким ділитеся посиланнями. Учасники можуть залишити список будь-коли.',
      ],
    ),
    LegalSection(
      heading: 'Гостьові акаунти',
      paragraphs: [
        'Якщо ви користуєтеся застосунком без акаунта, ваші списки прив\'язані до гостьового сеансу на цьому пристрої. Після виходу, очищення даних або видалення застосунку їх може бути неможливо відновити. Щоб зберегти їх, увійдіть через Google або Facebook у меню акаунта.',
      ],
    ),
    LegalSection(
      heading: 'Сторонні сервіси',
      paragraphs: [
        'Застосунок використовує сервіси з власними умовами. Те, як ми поводимося з вашими даними, описано в Політиці конфіденційності.',
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: 'Права на застосунок',
      paragraphs: [
        'Застосунок, його назва та дизайн належать ovitaliy. Не копіюйте, не змінюйте, не перепродавайте і не декомпілюйте його та не використовуйте його назву чи оформлення так, ніби ви пов\'язані з нами.',
      ],
    ),
    LegalSection(
      heading: 'Доступність і зміни',
      paragraphs: [
        'SyncedList надається безкоштовно та «як є». Ми намагаємося, щоб застосунок працював, а списки синхронізувалися, але не можемо обіцяти, що він завжди буде доступний, працюватиме без помилок або підтримуватиме ваш пристрій. Деяким функціям потрібен інтернет, і ваш оператор може стягувати плату за трафік. Ми можемо змінити, оновити або припинити роботу застосунку будь-коли.',
      ],
    ),
    LegalSection(
      heading: 'Відповідальність',
      paragraphs: [
        'У межах, дозволених законом, ovitaliy не несе відповідальності за збитки чи шкоду, що виникли внаслідок використання застосунку або неможливості ним скористатися, зокрема за втрату даних списків.',
      ],
    ),
    LegalSection(
      heading: 'Зміни умов',
      paragraphs: [
        'Ми можемо час від часу оновлювати ці умови. Зміни публікуються на цій сторінці з новою датою набрання чинності, і подальше користування застосунком означає згоду з ними.',
      ],
    ),
    LegalSection(
      heading: 'Контакти',
      paragraphs: ['Запитання:'],
      links: [_contact],
    ),
  ],
);
