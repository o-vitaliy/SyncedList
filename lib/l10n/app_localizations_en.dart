// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get loginExecuteFacebook => 'Continue with Facebook';

  @override
  String get loginExecuteGoogle => 'Continue with Google';

  @override
  String get appTagline =>
      'Shopping lists you share and check off together, in real time.';

  @override
  String get loginAnonymous => 'Continue without an account';

  @override
  String get getAndroidApp => 'Get the Android app';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get newList => 'New list';

  @override
  String get addItem => 'Add item';

  @override
  String get editItem => 'Edit item';

  @override
  String get renameList => 'Rename list';

  @override
  String get sharedList => 'Shared';

  @override
  String get sortMenu => 'Sort';

  @override
  String itemsProgress(int done, int total) {
    return '$done of $total done';
  }

  @override
  String get emptyListsBody => 'Create a list, then share it to shop together.';

  @override
  String get emptyItemsBody =>
      'Add the first item, or share the list so others can add theirs.';

  @override
  String get account => 'Account';

  @override
  String get guest => 'Guest';

  @override
  String get guestInfo =>
      'You\'re using SyncedList without an account. Sign in to keep your lists and use them on your other devices.';

  @override
  String get signedInWith => 'Signed in';

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutConfirm => 'Sign out of SyncedList?';

  @override
  String get accountLinked =>
      'Signed in. Your lists are saved to your account.';

  @override
  String get accountSwitched =>
      'Signed in to your existing account. Your lists were added to it.';

  @override
  String get openList => 'Open';
}
