// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Sua lista de compras está vazia.';

  @override
  String invitedInToLists(String name) {
    return 'A lista $name foi adicionada';
  }

  @override
  String loginToAddList(String name) {
    return '$name foi compartilhada com você. Entre para ver.';
  }

  @override
  String get emptyListInfo1 => 'Você ainda não tem nenhuma lista de compras.';

  @override
  String get rename => 'Renomear';

  @override
  String get deleteItemConfirm =>
      'Tem certeza de que deseja excluir este item?';

  @override
  String get deleteListConfirm =>
      'Tem certeza de que deseja excluir esta lista?';

  @override
  String get delete => 'Excluir';

  @override
  String get share => 'Compartilhar';

  @override
  String get yourLists => 'Suas listas';

  @override
  String get newItemName => 'Novo item';

  @override
  String get newListName => 'Nome da nova lista';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get passwordMatch => 'As senhas não coincidem';

  @override
  String get invalidEmailFormat => 'E-mail inválido';

  @override
  String get requiredField => 'Este campo é obrigatório';

  @override
  String get sortOneTime => 'Ordenar uma vez';

  @override
  String get sortAuto => 'Ordenar automaticamente';

  @override
  String get sortNameDone => 'Por nome e marcados';

  @override
  String get sortDone => 'Por marcados';

  @override
  String get sortName => 'Por nome';

  @override
  String get loginExecuteFacebook => 'Continuar com o Facebook';

  @override
  String get loginExecuteGoogle => 'Continuar com o Google';

  @override
  String get appTagline =>
      'Listas de compras que vocês compartilham e marcam juntos, em tempo real.';

  @override
  String get loginAnonymous => 'Continuar sem conta';

  @override
  String get getAndroidApp => 'Baixar o app para Android';

  @override
  String get termsOfUse => 'Termos de uso';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get newList => 'Nova lista';

  @override
  String get addItem => 'Adicionar item';

  @override
  String get editItem => 'Editar item';

  @override
  String get renameList => 'Renomear lista';

  @override
  String get sharedList => 'Compartilhada';

  @override
  String get sortMenu => 'Ordenar';

  @override
  String itemsProgress(int done, int total) {
    return '$done de $total comprados';
  }

  @override
  String get emptyListsBody =>
      'Crie uma lista e compartilhe para fazer compras juntos.';

  @override
  String get emptyItemsBody =>
      'Adicione o primeiro item ou compartilhe a lista para que outros adicionem os deles.';

  @override
  String get account => 'Conta';

  @override
  String get guest => 'Convidado';

  @override
  String get guestInfo =>
      'Você está usando o SyncedList sem conta. Entre para manter suas listas e usá-las em outros dispositivos.';

  @override
  String get signedInWith => 'Conectado';

  @override
  String get signOut => 'Sair';

  @override
  String get signOutConfirm => 'Sair do SyncedList?';

  @override
  String get accountLinked =>
      'Conectado. Suas listas foram salvas na sua conta.';

  @override
  String get accountSwitched =>
      'Você entrou na sua conta existente. Suas listas foram adicionadas a ela.';

  @override
  String get openList => 'Abrir';

  @override
  String get notificationsTitle => 'Notificações';

  @override
  String get notificationsInfo =>
      'Receba avisos quando outras pessoas adicionarem ou marcarem itens nas suas listas compartilhadas.';

  @override
  String get notificationsTurnOn => 'Ativar notificações';

  @override
  String get notificationsTurnOnShort => 'Ativar';

  @override
  String get notNow => 'Agora não';

  @override
  String get notificationsOn => 'As notificações estão ativadas';

  @override
  String get notificationsBlockedWeb =>
      'As notificações estão bloqueadas. Permita-as para este site nas configurações do navegador.';

  @override
  String get notificationsBlockedApp =>
      'As notificações estão desativadas. Ative-as para o SyncedList nas configurações do dispositivo.';

  @override
  String get notificationsIosHomeScreen =>
      'Para receber notificações no iPhone, adicione o SyncedList à Tela de Início: toque em Compartilhar e depois em Adicionar à Tela de Início.';
}
