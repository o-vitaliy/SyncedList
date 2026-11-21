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
  final ru = languageCode == 'ru';
  return switch (type) {
    LegalDocType.terms => ru ? _termsRu : _termsEn,
    LegalDocType.privacy => ru ? _privacyRu : _privacyEn,
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

const _privacyRu = LegalDoc(
  title: 'Политика конфиденциальности',
  effective: 'Действует с 21 ноября 2026 г.',
  sections: [
    LegalSection(
      paragraphs: [
        'SyncedList — бесплатное приложение для совместных списков покупок от ovitaliy. Оно доступно на Android, iOS и в браузере на syncedlist.web.app. Эта политика объясняет, какие данные обрабатывает приложение, зачем и кому они передаются. Пользуясь SyncedList, вы соглашаетесь с ней.',
      ],
    ),
    LegalSection(
      heading: 'Какие данные мы собираем',
      bullets: [
        LegalBullet(
          'Данные аккаунта.',
          'Если вы входите через Google или Facebook, мы получаем от них ваше имя, адрес электронной почты и фото профиля. Если вы продолжаете без аккаунта, мы создаём анонимный аккаунт со случайным ID и без личных данных.',
        ),
        LegalBullet(
          'Ваши списки.',
          'Названия списков и товары, их порядок, отметки о покупке, а также какие аккаунты состоят в каждом списке.',
        ),
        LegalBullet(
          'Отчёты о сбоях.',
          'Если приложение аварийно завершается или сталкивается с ошибкой, оно отправляет отчёт с такими сведениями, как модель устройства, версия операционной системы, версия приложения и его состояние в момент сбоя.',
        ),
        LegalBullet(
          'Настройки на устройстве.',
          'Тема, порядок сортировки товаров и ожидающие приглашения в списки хранятся только на вашем устройстве.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Как мы их используем',
      paragraphs: [
        'Мы используем эти данные только для работы приложения: чтобы вы могли войти, чтобы хранить ваши списки и синхронизировать их между вашими устройствами и с теми, с кем вы ими поделились, а также чтобы находить и исправлять ошибки. Мы не продаём ваши данные, не показываем рекламу и не используем данные для маркетинга.',
      ],
    ),
    LegalSection(
      heading: 'Кто их видит',
      bullets: [
        LegalBullet(
          'Те, с кем вы поделились списком.',
          'Любой, кто открывает ссылку на список, становится его участником и может просматривать и изменять его. Делитесь ссылками только с теми, кому доверяете.',
        ),
        LegalBullet(
          'Поставщики услуг.',
          'SyncedList работает на Google Firebase: Firebase Authentication (вход), Cloud Firestore (хранение списков), Firebase Crashlytics (отчёты о сбоях) и Firebase Hosting (сайт). Вход через Google или Facebook также проходит через эти компании. Каждая из них обрабатывает данные по своей политике.',
        ),
        LegalBullet(
          'Закон.',
          'Мы можем раскрыть данные, если этого требует закон.',
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: 'Хранение и удаление данных',
      paragraphs: [
        'Данные хранятся, пока вы пользуетесь приложением. Удаление списка в приложении убирает вас из участников, а сам список удаляется полностью, когда в нём не остаётся участников. Чтобы удалить аккаунт и все его данные, напишите нам на адрес ниже — мы сделаем это в течение 30 дней.',
      ],
    ),
    LegalSection(
      heading: 'Файлы cookie',
      paragraphs: [
        'Сайт хранит небольшие данные в вашем браузере (local storage и, для входа, cookie от Firebase, Google или Facebook), чтобы вы оставались в аккаунте и ваши настройки сохранялись. Они не используются для отслеживания или рекламы.',
      ],
    ),
    LegalSection(
      heading: 'Безопасность',
      paragraphs: [
        'Данные передаются по зашифрованным соединениям и хранятся на серверах Google. Ни один способ хранения или передачи не защищён полностью, поэтому мы не можем гарантировать абсолютную безопасность.',
      ],
    ),
    LegalSection(
      heading: 'Дети',
      paragraphs: [
        'SyncedList не предназначен для детей младше 13 лет, и мы сознательно не собираем их личные данные. Если вы считаете, что ребёнок передал нам личные данные, свяжитесь с нами, и мы их удалим.',
      ],
    ),
    LegalSection(
      heading: 'Изменения политики',
      paragraphs: [
        'Мы можем время от времени обновлять эту политику. Изменения публикуются на этой странице с новой датой вступления в силу.',
      ],
    ),
    LegalSection(
      heading: 'Контакты',
      paragraphs: ['Вопросы и запросы:'],
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

const _termsRu = LegalDoc(
  title: 'Условия использования',
  effective: 'Действуют с 21 ноября 2026 г.',
  sections: [
    LegalSection(
      paragraphs: [
        'Эти условия действуют, когда вы пользуетесь SyncedList — бесплатным приложением для совместных списков покупок от ovitaliy — на Android, iOS или в браузере на syncedlist.web.app. Пользуясь приложением, вы соглашаетесь с ними. Если вы не согласны, пожалуйста, не пользуйтесь приложением.',
      ],
    ),
    LegalSection(
      heading: 'Использование SyncedList',
      paragraphs: [
        'Пользоваться приложением можно с аккаунтом Google или Facebook либо без аккаунта. Вы отвечаете за содержимое своих списков и за безопасность своего устройства и аккаунтов. Не используйте приложение для незаконных целей, преследования других людей или вмешательства в работу сервиса и чужие данные.',
      ],
    ),
    LegalSection(
      heading: 'Совместные списки',
      paragraphs: [
        'Когда вы делитесь списком, любой, кто откроет ссылку, становится участником и может просматривать и изменять его. Вы отвечаете за то, с кем делитесь ссылками. Участники могут покинуть список в любой момент.',
      ],
    ),
    LegalSection(
      heading: 'Гостевые аккаунты',
      paragraphs: [
        'Если вы пользуетесь приложением без аккаунта, ваши списки привязаны к гостевой сессии на этом устройстве. После выхода, очистки данных или удаления приложения их может быть невозможно восстановить. Чтобы сохранить их, войдите через Google или Facebook в меню аккаунта.',
      ],
    ),
    LegalSection(
      heading: 'Сторонние сервисы',
      paragraphs: [
        'Приложение использует сервисы со своими условиями. То, как мы обращаемся с вашими данными, описано в Политике конфиденциальности.',
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: 'Права на приложение',
      paragraphs: [
        'Приложение, его название и дизайн принадлежат ovitaliy. Не копируйте, не изменяйте, не перепродавайте и не декомпилируйте его и не используйте его название или оформление так, будто вы связаны с нами.',
      ],
    ),
    LegalSection(
      heading: 'Доступность и изменения',
      paragraphs: [
        'SyncedList предоставляется бесплатно и «как есть». Мы стараемся, чтобы приложение работало, а списки синхронизировались, но не можем обещать, что оно всегда будет доступно, будет работать без ошибок или поддерживать ваше устройство. Некоторым функциям нужен интернет, и ваш оператор может взимать плату за трафик. Мы можем изменить, обновить или прекратить работу приложения в любое время.',
      ],
    ),
    LegalSection(
      heading: 'Ответственность',
      paragraphs: [
        'В той мере, в какой это допускает закон, ovitaliy не несёт ответственности за убытки или ущерб, возникшие в результате использования приложения или невозможности его использовать, включая потерю данных списков.',
      ],
    ),
    LegalSection(
      heading: 'Изменения условий',
      paragraphs: [
        'Мы можем время от времени обновлять эти условия. Изменения публикуются на этой странице с новой датой вступления в силу, и продолжение использования приложения означает согласие с ними.',
      ],
    ),
    LegalSection(
      heading: 'Контакты',
      paragraphs: ['Вопросы:'],
      links: [_contact],
    ),
  ],
);
