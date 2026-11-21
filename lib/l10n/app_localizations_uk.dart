// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Ваш список покупок порожній.';

  @override
  String invitedInToLists(String name) {
    return 'Список $name додано';
  }

  @override
  String loginToAddList(String name) {
    return 'З вами поділилися списком $name. Увійдіть, щоб переглянути його';
  }

  @override
  String get emptyListInfo1 => 'У вас ще немає списків покупок';

  @override
  String get rename => 'Перейменувати';

  @override
  String get deleteItemConfirm => 'Ви впевнені, що хочете видалити цей товар?';

  @override
  String get deleteListConfirm => 'Ви впевнені, що хочете видалити цей список?';

  @override
  String get delete => 'Видалити';

  @override
  String get share => 'Поділитися';

  @override
  String get yourLists => 'Ваші списки';

  @override
  String get newItemName => 'Новий товар';

  @override
  String get newListName => 'Назва нового списку';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Скасувати';

  @override
  String get save => 'Зберегти';

  @override
  String get passwordMatch => 'Паролі не збігаються';

  @override
  String get invalidEmailFormat => 'Неправильна адреса електронної пошти';

  @override
  String get requiredField => 'Це поле обов\'язкове';

  @override
  String get sortOneTime => 'Одноразове сортування';

  @override
  String get sortAuto => 'Автоматично';

  @override
  String get sortNameDone => 'За назвою та позначеними';

  @override
  String get sortDone => 'За позначеними';

  @override
  String get sortName => 'За назвою';

  @override
  String get loginExecuteFacebook => 'Продовжити з Facebook';

  @override
  String get loginExecuteGoogle => 'Продовжити з Google';

  @override
  String get appTagline =>
      'Списки покупок, які ви ведете разом — у реальному часі.';

  @override
  String get loginAnonymous => 'Продовжити без акаунта';

  @override
  String get getAndroidApp => 'Застосунок для Android';

  @override
  String get termsOfUse => 'Умови використання';

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'Як у системі';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get newList => 'Новий список';

  @override
  String get addItem => 'Додати';

  @override
  String get editItem => 'Змінити';

  @override
  String get renameList => 'Перейменувати список';

  @override
  String get sharedList => 'Спільний';

  @override
  String get sortMenu => 'Сортування';

  @override
  String itemsProgress(int done, int total) {
    return '$done з $total куплено';
  }

  @override
  String get emptyListsBody =>
      'Створіть список і поділіться ним, щоб купувати разом.';

  @override
  String get emptyItemsBody =>
      'Додайте перший товар або поділіться списком, щоб інші теж могли додавати.';

  @override
  String get account => 'Акаунт';

  @override
  String get guest => 'Гість';

  @override
  String get guestInfo =>
      'Ви користуєтеся SyncedList без акаунта. Увійдіть, щоб зберегти списки та відкривати їх на інших пристроях.';

  @override
  String get signedInWith => 'Вхід виконано';

  @override
  String get signOut => 'Вийти';

  @override
  String get signOutConfirm => 'Вийти з SyncedList?';

  @override
  String get accountLinked => 'Вхід виконано. Ваші списки збережено в акаунті.';

  @override
  String get accountSwitched =>
      'Ви увійшли в наявний акаунт. Ваші списки додано до нього.';

  @override
  String get openList => 'Відкрити';
}
