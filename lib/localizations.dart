import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class L {
  final String ln;

  L(this.ln);

  static Future<L> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return L(localeName);
    });
  }

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  String get loginTitle {
    return Intl.message('Login', name: 'loginTitle', locale: ln);
  }

  String get emailHint {
    return Intl.message('Email', name: 'emailHint', locale: ln);
  }

  String get passwordHint {
    return Intl.message('Password', name: 'passwordHint', locale: ln);
  }

  String get passwordConfirmHint {
    return Intl.message('Repeat password',
        name: 'passwordConfirmHint', locale: ln);
  }

  String get doLogin {
    return Intl.message('Login', name: 'doLogin', locale: ln);
  }

  String get doLoginWithGoogle {
    return Intl.message('Google Login', name: 'doLoginWithGoogle', locale: ln);
  }

  String get toRegistration {
    return Intl.message('Registration', name: 'toRegistration', locale: ln);
  }

  String get registerTitle {
    return Intl.message('Sign Up', name: 'registerTitle', locale: ln);
  }

  String get doRegister {
    return Intl.message('Sign Up', name: 'doRegister', locale: ln);
  }

  String get requiredField {
    return Intl.message('This field is required',
        name: 'requiredField', locale: ln);
  }

  String get invalidEmailFormat {
    return Intl.message('Invalid email',
        name: 'invalidEmailFormat', locale: ln);
  }

  String get passwordMatch {
    return Intl.message('Passwords don\'t match',
        name: 'passwordMatch', locale: ln);
  }

  String get unexpectedError {
    return Intl.message("We are sorry. An unexpected error has happened :((",
        name: 'unexpectedError', locale: ln);
  }

  String get view {
    return Intl.message("View", name: 'view', locale: ln);
  }

  String get save {
    return Intl.message("Save", name: 'save', locale: ln);
  }

  String get cancel {
    return Intl.message("Cancel", name: 'cancel', locale: ln);
  }

  String get ok {
    return Intl.message("Ok", name: 'ok', locale: ln);
  }

  String get newListName {
    return Intl.message("New list name", name: 'newListName', locale: ln);
  }

  String get newItemName {
    return Intl.message("New item", name: 'newItemName', locale: ln);
  }

  String get yourLists {
    return Intl.message('Your lists', name: 'yourLists', locale: ln);
  }

  String get share {
    return Intl.message('Share', name: 'share', locale: ln);
  }

  String get delete {
    return Intl.message('Delete', name: 'delete', locale: ln);
  }

  String get deleteListConfirm {
    return Intl.message('Are sure you want to delete this list?',
        name: 'deleteListConfirm', locale: ln);
  }
  String get deleteItemConfirm {
    return Intl.message('Are sure you want to delete this item?',
        name: 'deleteItemConfirm', locale: ln);
  }

  String get rename {
    return Intl.message('Rename', name: 'rename', locale: ln);
  }

  String get emptyListInfo1 {
    return Intl.message("You don\'t have any shopping list.",
        name: 'emptyListInfo1', locale: ln);
  }

  String get emptyListInfoClick {
    return Intl.message("Click", name: 'emptyListInfoClick', locale: ln);
  }

  String get emptyListInfoClickToCreate {
    return Intl.message(" to create new one. ",
        name: 'emptyListInfoClickToCreate', locale: ln);
  }

  String get emptyListInfoClickToShare {
    return Intl.message(" to share a content of the shopping list. ",
        name: 'emptyListInfoClickToShare', locale: ln);
  }

  String get emptyListEnjoySharing {
    return Intl.message("Enjoy checking the list together",
        name: 'emptyListEnjoySharing', locale: ln);
  }

  String loginToAddList(String name) {
    return Intl.message("$name was shared with you. Login to view it.",
        name: 'loginToAddList', locale: ln, args: [name]);
  }

  String invitedInToLists(String names) {
    return Intl.message("$names list has been added",
        name: 'invitedInToLists', locale: ln, args: [names]);
  }

  String get emptyItemsListInfo1 {
    return Intl.message("Your shopping list is empty.",
        name: 'emptyItemsListInfo1', locale: ln);
  }

  String get emptyItemsListInfoClickToCreate {
    return Intl.message(" add new items. ",
        name: 'emptyItemsListInfoClickToCreate', locale: ln);
  }

  String get emptyItemsListInfoClickToShare {
    return Intl.message(" to share the shopping list.",
        name: 'emptyListInfoClickToShare', locale: ln);
  }


  String get(key) {
    return {
          "requiredField": requiredField,
          "invalidEmailFormat": invalidEmailFormat,
          "passwordMatch": passwordMatch,
        }[key] ??
        key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<L> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<L> load(Locale locale) => L.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
