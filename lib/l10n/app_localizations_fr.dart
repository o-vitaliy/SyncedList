// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Votre liste de courses est vide.';

  @override
  String invitedInToLists(String name) {
    return 'La liste $name a été ajoutée';
  }

  @override
  String loginToAddList(String name) {
    return '$name a été partagée avec vous. Connectez-vous pour la voir.';
  }

  @override
  String get emptyListInfo1 => 'Vous n\'avez pas encore de liste de courses.';

  @override
  String get rename => 'Renommer';

  @override
  String get deleteItemConfirm =>
      'Voulez-vous vraiment supprimer cet article ?';

  @override
  String get deleteListConfirm =>
      'Voulez-vous vraiment supprimer cette liste ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get share => 'Partager';

  @override
  String get yourLists => 'Vos listes';

  @override
  String get newItemName => 'Nouvel article';

  @override
  String get newListName => 'Nom de la nouvelle liste';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get passwordMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get invalidEmailFormat => 'Adresse e-mail non valide';

  @override
  String get requiredField => 'Ce champ est obligatoire';

  @override
  String get sortOneTime => 'Trier une fois';

  @override
  String get sortAuto => 'Tri automatique';

  @override
  String get sortNameDone => 'Par nom et cochés';

  @override
  String get sortDone => 'Par cochés';

  @override
  String get sortName => 'Par nom';

  @override
  String get loginExecuteFacebook => 'Continuer avec Facebook';

  @override
  String get loginExecuteGoogle => 'Continuer avec Google';

  @override
  String get appTagline =>
      'Des listes de courses à partager et cocher ensemble, en temps réel.';

  @override
  String get loginAnonymous => 'Continuer sans compte';

  @override
  String get getAndroidApp => 'Télécharger l\'app Android';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get themeTitle => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get newList => 'Nouvelle liste';

  @override
  String get addItem => 'Ajouter un article';

  @override
  String get editItem => 'Modifier l\'article';

  @override
  String get renameList => 'Renommer la liste';

  @override
  String get sharedList => 'Partagée';

  @override
  String get sortMenu => 'Trier';

  @override
  String itemsProgress(int done, int total) {
    return '$done sur $total achetés';
  }

  @override
  String get emptyListsBody =>
      'Créez une liste, puis partagez-la pour faire les courses ensemble.';

  @override
  String get emptyItemsBody =>
      'Ajoutez le premier article ou partagez la liste pour que d\'autres ajoutent les leurs.';

  @override
  String get account => 'Compte';

  @override
  String get guest => 'Invité';

  @override
  String get guestInfo =>
      'Vous utilisez SyncedList sans compte. Connectez-vous pour conserver vos listes et les utiliser sur vos autres appareils.';

  @override
  String get signedInWith => 'Connecté';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get signOutConfirm => 'Se déconnecter de SyncedList ?';

  @override
  String get accountLinked =>
      'Connecté. Vos listes sont enregistrées dans votre compte.';

  @override
  String get accountSwitched =>
      'Connecté à votre compte existant. Vos listes y ont été ajoutées.';

  @override
  String get openList => 'Ouvrir';
}
