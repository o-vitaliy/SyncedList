// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emptyItemsListInfoClickToShare => ' to share the shopping list.';

  @override
  String get emptyItemsListInfoClickToCreate => ' add new items.';

  @override
  String get emptyItemsListInfo1 => 'Your shopping list is empty.';

  @override
  String invitedInToLists(String name) {
    return '$name list has been added';
  }

  @override
  String loginToAddList(String name) {
    return '$name has been shared with you. Login to view it.';
  }

  @override
  String get emptyListEnjoySharing => 'Enjoy checking a list together';

  @override
  String get emptyListInfoClickToShare =>
      'to share a content of the shopping list.';

  @override
  String get emptyListInfoClickToCreate => 'to create new one.';

  @override
  String get emptyListInfoClick => 'Click';

  @override
  String get emptyListInfo1 => 'You don\'t have any shopping list yet.';

  @override
  String get rename => 'Rename';

  @override
  String get deleteItemConfirm => 'Are sure you want to delete this item?';

  @override
  String get deleteListConfirm => 'Are sure you want to delete this list?';

  @override
  String get delete => 'Delete';

  @override
  String get share => 'To share';

  @override
  String get yourLists => 'Your lists';

  @override
  String get newItemName => 'New item';

  @override
  String get newListName => 'New list name';

  @override
  String get ok => 'Ok';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get view => 'View';

  @override
  String get unexpectedError =>
      'We are sorry. Unexpected error has happened :((';

  @override
  String get passwordMatch => 'Passwords don\'t match';

  @override
  String get invalidEmailFormat => 'Invalid email';

  @override
  String get requiredField => 'This field is required';

  @override
  String get sortOneTime => 'One time sort';

  @override
  String get sortAuto => 'Auto sort';

  @override
  String get sortNameDone => 'By name & done';

  @override
  String get sortDone => 'By done';

  @override
  String get sortName => 'By name';

  @override
  String get registerExecute => 'Sign Up';

  @override
  String get registerTitle => 'Sign Up';

  @override
  String get registerTo => 'Sign Up';

  @override
  String get hintPasswordConfirm => 'Repeat password';

  @override
  String get hintPassword => 'Password';

  @override
  String get hintEmail => 'Email';

  @override
  String get loginExecuteFacebook => 'Login with Facebook';

  @override
  String get loginExecuteGoogle => 'Login with Google';

  @override
  String get loginExecute => 'Login';

  @override
  String get loginTitle => 'Login';
}
