// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Deine Einkaufsliste ist leer.';

  @override
  String invitedInToLists(String name) {
    return 'Liste $name wurde hinzugefügt';
  }

  @override
  String loginToAddList(String name) {
    return '$name wurde mit dir geteilt. Melde dich an, um sie zu sehen.';
  }

  @override
  String get emptyListInfo1 => 'Du hast noch keine Einkaufsliste.';

  @override
  String get rename => 'Umbenennen';

  @override
  String get deleteItemConfirm =>
      'Möchtest du diesen Artikel wirklich löschen?';

  @override
  String get deleteListConfirm => 'Möchtest du diese Liste wirklich löschen?';

  @override
  String get delete => 'Löschen';

  @override
  String get share => 'Teilen';

  @override
  String get yourLists => 'Deine Listen';

  @override
  String get newItemName => 'Neuer Artikel';

  @override
  String get newListName => 'Name der neuen Liste';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get passwordMatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get invalidEmailFormat => 'Ungültige E-Mail-Adresse';

  @override
  String get requiredField => 'Dieses Feld ist erforderlich';

  @override
  String get sortOneTime => 'Einmal sortieren';

  @override
  String get sortAuto => 'Automatisch sortieren';

  @override
  String get sortNameDone => 'Nach Name und Erledigt';

  @override
  String get sortDone => 'Nach Erledigt';

  @override
  String get sortName => 'Nach Name';

  @override
  String get loginExecuteFacebook => 'Weiter mit Facebook';

  @override
  String get loginExecuteGoogle => 'Weiter mit Google';

  @override
  String get appTagline =>
      'Einkaufslisten, die ihr gemeinsam teilt und abhakt – in Echtzeit.';

  @override
  String get loginAnonymous => 'Ohne Konto fortfahren';

  @override
  String get getAndroidApp => 'Android-App holen';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get themeTitle => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get newList => 'Neue Liste';

  @override
  String get addItem => 'Artikel hinzufügen';

  @override
  String get editItem => 'Artikel bearbeiten';

  @override
  String get renameList => 'Liste umbenennen';

  @override
  String get sharedList => 'Geteilt';

  @override
  String get sortMenu => 'Sortieren';

  @override
  String itemsProgress(int done, int total) {
    return '$done von $total erledigt';
  }

  @override
  String get emptyListsBody =>
      'Erstelle eine Liste und teile sie, um gemeinsam einzukaufen.';

  @override
  String get emptyItemsBody =>
      'Füge den ersten Artikel hinzu oder teile die Liste, damit andere ihre hinzufügen können.';

  @override
  String get account => 'Konto';

  @override
  String get guest => 'Gast';

  @override
  String get guestInfo =>
      'Du nutzt SyncedList ohne Konto. Melde dich an, um deine Listen zu behalten und auf anderen Geräten zu nutzen.';

  @override
  String get signedInWith => 'Angemeldet';

  @override
  String get signOut => 'Abmelden';

  @override
  String get signOutConfirm => 'Von SyncedList abmelden?';

  @override
  String get accountLinked =>
      'Angemeldet. Deine Listen sind in deinem Konto gespeichert.';

  @override
  String get accountSwitched =>
      'Bei deinem bestehenden Konto angemeldet. Deine Listen wurden hinzugefügt.';

  @override
  String get openList => 'Öffnen';
}
