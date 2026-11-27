// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'La tua lista della spesa è vuota.';

  @override
  String invitedInToLists(String name) {
    return 'La lista $name è stata aggiunta';
  }

  @override
  String loginToAddList(String name) {
    return '$name è stata condivisa con te. Accedi per vederla.';
  }

  @override
  String get emptyListInfo1 => 'Non hai ancora nessuna lista della spesa.';

  @override
  String get rename => 'Rinomina';

  @override
  String get deleteItemConfirm => 'Vuoi davvero eliminare questo articolo?';

  @override
  String get deleteListConfirm => 'Vuoi davvero eliminare questa lista?';

  @override
  String get delete => 'Elimina';

  @override
  String get share => 'Condividi';

  @override
  String get yourLists => 'Le tue liste';

  @override
  String get newItemName => 'Nuovo articolo';

  @override
  String get newListName => 'Nome della nuova lista';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get passwordMatch => 'Le password non corrispondono';

  @override
  String get invalidEmailFormat => 'Indirizzo email non valido';

  @override
  String get requiredField => 'Questo campo è obbligatorio';

  @override
  String get sortOneTime => 'Ordina una volta';

  @override
  String get sortAuto => 'Ordina automaticamente';

  @override
  String get sortNameDone => 'Per nome e spuntati';

  @override
  String get sortDone => 'Per spuntati';

  @override
  String get sortName => 'Per nome';

  @override
  String get loginExecuteFacebook => 'Continua con Facebook';

  @override
  String get loginExecuteGoogle => 'Continua con Google';

  @override
  String get appTagline =>
      'Liste della spesa da condividere e spuntare insieme, in tempo reale.';

  @override
  String get loginAnonymous => 'Continua senza account';

  @override
  String get getAndroidApp => 'Scarica l\'app per Android';

  @override
  String get termsOfUse => 'Condizioni d\'uso';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get newList => 'Nuova lista';

  @override
  String get addItem => 'Aggiungi articolo';

  @override
  String get editItem => 'Modifica articolo';

  @override
  String get renameList => 'Rinomina lista';

  @override
  String get sharedList => 'Condivisa';

  @override
  String get sortMenu => 'Ordina';

  @override
  String itemsProgress(int done, int total) {
    return '$done di $total presi';
  }

  @override
  String get emptyListsBody =>
      'Crea una lista e condividila per fare la spesa insieme.';

  @override
  String get emptyItemsBody =>
      'Aggiungi il primo articolo o condividi la lista perché anche gli altri possano aggiungere i loro.';

  @override
  String get account => 'Account';

  @override
  String get guest => 'Ospite';

  @override
  String get guestInfo =>
      'Stai usando SyncedList senza account. Accedi per conservare le tue liste e usarle sugli altri dispositivi.';

  @override
  String get signedInWith => 'Accesso effettuato';

  @override
  String get signOut => 'Esci';

  @override
  String get signOutConfirm => 'Uscire da SyncedList?';

  @override
  String get accountLinked =>
      'Accesso effettuato. Le tue liste sono salvate nel tuo account.';

  @override
  String get accountSwitched =>
      'Hai effettuato l\'accesso al tuo account esistente. Le tue liste sono state aggiunte.';

  @override
  String get openList => 'Apri';

  @override
  String get notificationsTitle => 'Notifiche';

  @override
  String get notificationsInfo =>
      'Ricevi una notifica quando altri aggiungono o spuntano articoli nelle tue liste condivise.';

  @override
  String get notificationsTurnOn => 'Attiva le notifiche';

  @override
  String get notificationsTurnOnShort => 'Attiva';

  @override
  String get notNow => 'Non ora';

  @override
  String get notificationsOn => 'Le notifiche sono attive';

  @override
  String get notificationsBlockedWeb =>
      'Le notifiche sono bloccate. Consentile per questo sito nelle impostazioni del browser.';

  @override
  String get notificationsBlockedApp =>
      'Le notifiche sono disattivate. Attivale per SyncedList nelle impostazioni del dispositivo.';

  @override
  String get notificationsIosHomeScreen =>
      'Per ricevere notifiche su iPhone, aggiungi SyncedList alla schermata Home: tocca Condividi, poi Aggiungi alla schermata Home.';
}
