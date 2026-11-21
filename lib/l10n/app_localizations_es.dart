// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Tu lista de la compra está vacía.';

  @override
  String invitedInToLists(String name) {
    return 'Se ha añadido la lista $name';
  }

  @override
  String loginToAddList(String name) {
    return 'Han compartido contigo $name. Inicia sesión para verla.';
  }

  @override
  String get emptyListInfo1 => 'Todavía no tienes ninguna lista de la compra.';

  @override
  String get rename => 'Cambiar nombre';

  @override
  String get deleteItemConfirm => '¿Seguro que quieres eliminar este producto?';

  @override
  String get deleteListConfirm => '¿Seguro que quieres eliminar esta lista?';

  @override
  String get delete => 'Eliminar';

  @override
  String get share => 'Compartir';

  @override
  String get yourLists => 'Tus listas';

  @override
  String get newItemName => 'Nuevo producto';

  @override
  String get newListName => 'Nombre de la nueva lista';

  @override
  String get ok => 'Aceptar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get passwordMatch => 'Las contraseñas no coinciden';

  @override
  String get invalidEmailFormat => 'Correo electrónico no válido';

  @override
  String get requiredField => 'Este campo es obligatorio';

  @override
  String get sortOneTime => 'Ordenar una vez';

  @override
  String get sortAuto => 'Ordenar automáticamente';

  @override
  String get sortNameDone => 'Por nombre y marcados';

  @override
  String get sortDone => 'Por marcados';

  @override
  String get sortName => 'Por nombre';

  @override
  String get loginExecuteFacebook => 'Continuar con Facebook';

  @override
  String get loginExecuteGoogle => 'Continuar con Google';

  @override
  String get appTagline =>
      'Listas de la compra que compartes y marcas en equipo, en tiempo real.';

  @override
  String get loginAnonymous => 'Continuar sin cuenta';

  @override
  String get getAndroidApp => 'Descargar la app para Android';

  @override
  String get termsOfUse => 'Condiciones de uso';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get newList => 'Nueva lista';

  @override
  String get addItem => 'Añadir producto';

  @override
  String get editItem => 'Editar producto';

  @override
  String get renameList => 'Cambiar nombre de la lista';

  @override
  String get sharedList => 'Compartida';

  @override
  String get sortMenu => 'Ordenar';

  @override
  String itemsProgress(int done, int total) {
    return '$done de $total comprados';
  }

  @override
  String get emptyListsBody =>
      'Crea una lista y compártela para hacer la compra juntos.';

  @override
  String get emptyItemsBody =>
      'Añade el primer producto o comparte la lista para que otros añadan los suyos.';

  @override
  String get account => 'Cuenta';

  @override
  String get guest => 'Invitado';

  @override
  String get guestInfo =>
      'Estás usando SyncedList sin cuenta. Inicia sesión para conservar tus listas y usarlas en tus otros dispositivos.';

  @override
  String get signedInWith => 'Sesión iniciada';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get signOutConfirm => '¿Cerrar sesión en SyncedList?';

  @override
  String get accountLinked =>
      'Sesión iniciada. Tus listas se han guardado en tu cuenta.';

  @override
  String get accountSwitched =>
      'Has iniciado sesión en tu cuenta existente. Tus listas se han añadido a ella.';

  @override
  String get openList => 'Abrir';
}
