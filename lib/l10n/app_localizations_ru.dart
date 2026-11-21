// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Ваш список покупок пуст.';

  @override
  String invitedInToLists(String name) {
    return 'Список $name был добавлен';
  }

  @override
  String loginToAddList(String name) {
    return 'С вами доделились списком $name. Войдите, чтобы его просмотреть';
  }

  @override
  String get emptyListInfo1 => 'У вас еще нет списков покупок';

  @override
  String get rename => 'Переименовать';

  @override
  String get deleteItemConfirm => 'Вы уверены, что хотите удалить этот товар?';

  @override
  String get deleteListConfirm => 'Вы уверены, что хотите удалить этот список?';

  @override
  String get delete => 'Удалить';

  @override
  String get share => 'Поделиться';

  @override
  String get yourLists => 'Ваши списки';

  @override
  String get newItemName => 'Новый предмет';

  @override
  String get newListName => 'Название нового списка';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get passwordMatch => 'Пароли не совпадают';

  @override
  String get invalidEmailFormat => 'Неверный адрес электронной почты';

  @override
  String get requiredField => 'Это поле обязательно к заполнению';

  @override
  String get sortOneTime => 'Разовая сортировка';

  @override
  String get sortAuto => 'Автоматически';

  @override
  String get sortNameDone => 'По имени и отмеченным';

  @override
  String get sortDone => 'По отмеченным ';

  @override
  String get sortName => 'По имени';

  @override
  String get loginExecuteFacebook => 'Продолжить с Facebook';

  @override
  String get loginExecuteGoogle => 'Продолжить с Google';

  @override
  String get appTagline =>
      'Списки покупок, которые вы ведёте вместе — в реальном времени.';

  @override
  String get loginAnonymous => 'Продолжить без аккаунта';

  @override
  String get getAndroidApp => 'Приложение для Android';

  @override
  String get termsOfUse => 'Условия использования';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'Как в системе';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get newList => 'Новый список';

  @override
  String get addItem => 'Добавить';

  @override
  String get editItem => 'Изменить';

  @override
  String get renameList => 'Переименовать список';

  @override
  String get sharedList => 'Общий';

  @override
  String get sortMenu => 'Сортировка';

  @override
  String itemsProgress(int done, int total) {
    return '$done из $total куплено';
  }

  @override
  String get emptyListsBody =>
      'Создайте список и поделитесь им, чтобы покупать вместе.';

  @override
  String get emptyItemsBody =>
      'Добавьте первый товар или поделитесь списком, чтобы другие тоже могли добавлять.';

  @override
  String get account => 'Аккаунт';

  @override
  String get guest => 'Гость';

  @override
  String get guestInfo =>
      'Вы пользуетесь SyncedList без аккаунта. Войдите, чтобы сохранить списки и открывать их на других устройствах.';

  @override
  String get signedInWith => 'Вход выполнен';

  @override
  String get signOut => 'Выйти';

  @override
  String get signOutConfirm => 'Выйти из SyncedList?';

  @override
  String get accountLinked =>
      'Вход выполнен. Ваши списки сохранены в аккаунте.';

  @override
  String get accountSwitched =>
      'Вы вошли в существующий аккаунт. Ваши списки добавлены в него.';
}
