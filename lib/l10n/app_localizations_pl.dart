// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Twoja lista zakupów jest pusta.';

  @override
  String invitedInToLists(String name) {
    return 'Dodano listę $name';
  }

  @override
  String loginToAddList(String name) {
    return 'Udostępniono Ci listę $name. Zaloguj się, aby ją zobaczyć.';
  }

  @override
  String get emptyListInfo1 => 'Nie masz jeszcze żadnej listy zakupów.';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get deleteItemConfirm => 'Czy na pewno chcesz usunąć ten produkt?';

  @override
  String get deleteListConfirm => 'Czy na pewno chcesz usunąć tę listę?';

  @override
  String get delete => 'Usuń';

  @override
  String get share => 'Udostępnij';

  @override
  String get yourLists => 'Twoje listy';

  @override
  String get newItemName => 'Nowy produkt';

  @override
  String get newListName => 'Nazwa nowej listy';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Anuluj';

  @override
  String get save => 'Zapisz';

  @override
  String get passwordMatch => 'Hasła nie są zgodne';

  @override
  String get invalidEmailFormat => 'Nieprawidłowy adres e-mail';

  @override
  String get requiredField => 'To pole jest wymagane';

  @override
  String get sortOneTime => 'Sortuj jednorazowo';

  @override
  String get sortAuto => 'Sortuj automatycznie';

  @override
  String get sortNameDone => 'Według nazwy i odhaczonych';

  @override
  String get sortDone => 'Według odhaczonych';

  @override
  String get sortName => 'Według nazwy';

  @override
  String get loginExecuteFacebook => 'Kontynuuj z Facebookiem';

  @override
  String get loginExecuteGoogle => 'Kontynuuj z Google';

  @override
  String get appTagline =>
      'Listy zakupów, które prowadzicie razem — w czasie rzeczywistym.';

  @override
  String get loginAnonymous => 'Kontynuuj bez konta';

  @override
  String get getAndroidApp => 'Aplikacja na Androida';

  @override
  String get termsOfUse => 'Warunki korzystania';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get themeTitle => 'Motyw';

  @override
  String get themeSystem => 'Systemowy';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get newList => 'Nowa lista';

  @override
  String get addItem => 'Dodaj produkt';

  @override
  String get editItem => 'Edytuj produkt';

  @override
  String get renameList => 'Zmień nazwę listy';

  @override
  String get sharedList => 'Wspólna';

  @override
  String get sortMenu => 'Sortuj';

  @override
  String itemsProgress(int done, int total) {
    return 'Kupiono $done z $total';
  }

  @override
  String get emptyListsBody =>
      'Utwórz listę i udostępnij ją, aby robić zakupy razem.';

  @override
  String get emptyItemsBody =>
      'Dodaj pierwszy produkt albo udostępnij listę, aby inni też mogli dodawać.';

  @override
  String get account => 'Konto';

  @override
  String get guest => 'Gość';

  @override
  String get guestInfo =>
      'Korzystasz z SyncedList bez konta. Zaloguj się, aby zachować listy i używać ich na innych urządzeniach.';

  @override
  String get signedInWith => 'Zalogowano';

  @override
  String get signOut => 'Wyloguj się';

  @override
  String get signOutConfirm => 'Wylogować się z SyncedList?';

  @override
  String get accountLinked => 'Zalogowano. Twoje listy są zapisane na koncie.';

  @override
  String get accountSwitched =>
      'Zalogowano na istniejące konto. Twoje listy zostały do niego dodane.';

  @override
  String get openList => 'Otwórz';

  @override
  String get notificationsTitle => 'Powiadomienia';

  @override
  String get notificationsInfo =>
      'Otrzymuj powiadomienia, gdy inni dodają lub odhaczają produkty na Twoich wspólnych listach.';

  @override
  String get notificationsTurnOn => 'Włącz powiadomienia';

  @override
  String get notificationsTurnOnShort => 'Włącz';

  @override
  String get notNow => 'Nie teraz';

  @override
  String get notificationsOn => 'Powiadomienia są włączone';

  @override
  String get notificationsBlockedWeb =>
      'Powiadomienia są zablokowane. Zezwól na nie dla tej witryny w ustawieniach przeglądarki.';

  @override
  String get notificationsBlockedApp =>
      'Powiadomienia są wyłączone. Włącz je dla SyncedList w ustawieniach urządzenia.';

  @override
  String get notificationsIosHomeScreen =>
      'Aby otrzymywać powiadomienia na iPhonie, dodaj SyncedList do ekranu początkowego: stuknij Udostępnij, a potem Do ekranu początkowego.';
}
