// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Váš nákupní seznam je prázdný.';

  @override
  String invitedInToLists(String name) {
    return 'Seznam $name byl přidán';
  }

  @override
  String loginToAddList(String name) {
    return 'Někdo s vámi sdílel seznam $name. Přihlaste se a zobrazte si ho.';
  }

  @override
  String get emptyListInfo1 => 'Zatím nemáte žádný nákupní seznam.';

  @override
  String get rename => 'Přejmenovat';

  @override
  String get deleteItemConfirm => 'Opravdu chcete tuto položku smazat?';

  @override
  String get deleteListConfirm => 'Opravdu chcete tento seznam smazat?';

  @override
  String get delete => 'Smazat';

  @override
  String get share => 'Sdílet';

  @override
  String get yourLists => 'Vaše seznamy';

  @override
  String get newItemName => 'Nová položka';

  @override
  String get newListName => 'Název nového seznamu';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Zrušit';

  @override
  String get save => 'Uložit';

  @override
  String get passwordMatch => 'Hesla se neshodují';

  @override
  String get invalidEmailFormat => 'Neplatný e-mail';

  @override
  String get requiredField => 'Toto pole je povinné';

  @override
  String get sortOneTime => 'Seřadit jednou';

  @override
  String get sortAuto => 'Řadit automaticky';

  @override
  String get sortNameDone => 'Podle názvu a odškrtnutí';

  @override
  String get sortDone => 'Podle odškrtnutí';

  @override
  String get sortName => 'Podle názvu';

  @override
  String get loginExecuteFacebook => 'Pokračovat přes Facebook';

  @override
  String get loginExecuteGoogle => 'Pokračovat přes Google';

  @override
  String get appTagline =>
      'Nákupní seznamy, které sdílíte a odškrtáváte společně – v reálném čase.';

  @override
  String get loginAnonymous => 'Pokračovat bez účtu';

  @override
  String get getAndroidApp => 'Aplikace pro Android';

  @override
  String get termsOfUse => 'Podmínky použití';

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get themeTitle => 'Motiv';

  @override
  String get themeSystem => 'Podle systému';

  @override
  String get themeLight => 'Světlý';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get newList => 'Nový seznam';

  @override
  String get addItem => 'Přidat položku';

  @override
  String get editItem => 'Upravit položku';

  @override
  String get renameList => 'Přejmenovat seznam';

  @override
  String get sharedList => 'Sdílený';

  @override
  String get sortMenu => 'Seřadit';

  @override
  String itemsProgress(int done, int total) {
    return 'Koupeno $done z $total';
  }

  @override
  String get emptyListsBody =>
      'Vytvořte seznam a sdílejte ho, abyste mohli nakupovat společně.';

  @override
  String get emptyItemsBody =>
      'Přidejte první položku nebo seznam sdílejte, aby ostatní mohli přidávat své.';

  @override
  String get account => 'Účet';

  @override
  String get guest => 'Host';

  @override
  String get guestInfo =>
      'Používáte SyncedList bez účtu. Přihlaste se, abyste si seznamy uchovali a mohli je používat na dalších zařízeních.';

  @override
  String get signedInWith => 'Přihlášeno';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get signOutConfirm => 'Odhlásit se ze SyncedList?';

  @override
  String get accountLinked =>
      'Přihlášeno. Vaše seznamy jsou uložené ve vašem účtu.';

  @override
  String get accountSwitched =>
      'Přihlásili jste se ke stávajícímu účtu. Vaše seznamy do něj byly přidány.';

  @override
  String get openList => 'Otevřít';

  @override
  String get notificationsTitle => 'Oznámení';

  @override
  String get notificationsInfo =>
      'Dostávejte oznámení, když ostatní přidají nebo odškrtnou položky ve vašich sdílených seznamech.';

  @override
  String get notificationsTurnOn => 'Zapnout oznámení';

  @override
  String get notificationsTurnOnShort => 'Zapnout';

  @override
  String get notNow => 'Teď ne';

  @override
  String get notificationsOn => 'Oznámení jsou zapnutá';

  @override
  String get notificationsBlockedWeb =>
      'Oznámení jsou zablokovaná. Povolte je pro tento web v nastavení prohlížeče.';

  @override
  String get notificationsBlockedApp =>
      'Oznámení jsou vypnutá. Zapněte je pro SyncedList v nastavení zařízení.';

  @override
  String get notificationsIosHomeScreen =>
      'Chcete-li dostávat oznámení na iPhonu, přidejte SyncedList na plochu: klepněte na Sdílet a pak na Přidat na plochu.';
}
