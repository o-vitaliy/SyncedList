// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get emptyItemsListInfoClickToShare => 'чтобы поделиться списком';

  @override
  String get emptyItemsListInfoClickToCreate => 'чтобы добавить новый товар';

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
  String get emptyListEnjoySharing =>
      'Наслаждайся совместным использованием списка';

  @override
  String get emptyListInfoClickToShare => 'чтобы поделиться списком';

  @override
  String get emptyListInfoClickToCreate => 'чтобы создать новый';

  @override
  String get emptyListInfoClick => 'Нажмите';

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
  String get view => 'Вид';

  @override
  String get unexpectedError => 'Мы сожалеем. Произошла неожиданная ошибка :((';

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
  String get registerExecute => 'Зарегистрироваться';

  @override
  String get registerTitle => 'Зарегистрироваться';

  @override
  String get registerTo => 'Зарегистрироваться';

  @override
  String get hintPasswordConfirm => 'Повторите пароль';

  @override
  String get hintPassword => 'Пароль';

  @override
  String get hintEmail => 'Электронное письмо';

  @override
  String get loginExecuteFacebook => 'Войти через Facebook';

  @override
  String get loginExecuteGoogle => 'Вход через Google';

  @override
  String get loginExecute => 'Авторизоваться';

  @override
  String get loginTitle => 'Авторизоваться';
}
