// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'l.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

class L {
  L(this.locale) : this.labels = languages[locale];

  final Locale locale;

  static final Map<Locale, L_Labels> languages = {
    Locale.fromSubtags(languageCode: "en"): L_Labels(
      requiredField: "This field is required",
      invalidEmailFormat: "Invalid email",
      passwordMatch: "Passwords don't match",
      unexpectedError: "We are sorry. Unexpected error has happened :((",
      view: "View",
      save: "Save",
      cancel: "Cancel",
      ok: "Ok",
      newListName: "New list name",
      newItemName: "New item",
      yourLists: "Your lists",
      share: "To share",
      delete: "Delete",
      deleteListConfirm: "Are sure you want to delete this list?",
      deleteItemConfirm: "Are sure you want to delete this item?",
      rename: "Rename",
      emptyListInfo1: "You don't have any shopping list yet.",
      emptyListInfoClick: "Click",
      emptyListInfoClickToCreate: "to create new one.",
      emptyListInfoClickToShare: "to share a content of the shopping list.",
      emptyListEnjoySharing: "Enjoy checking a list together",
      loginToAddList: ({name}) =>
          "${name} has been shared with you. Login to view it.",
      invitedInToLists: ({name}) => "${name} list has been added",
      emptyItemsListInfo1: "Your shopping list is empty.",
      emptyItemsListInfoClickToCreate: " add new items.",
      emptyItemsListInfoClickToShare: " to share the shopping list.",
      login: AppLocalizations_Labels_Login(
        title: "Login",
        execute: "Login",
        executeGoogle: "Login with Google",
        executeFacebook: "Login with Facebook",
      ),
      hint: AppLocalizations_Labels_Hint(
        email: "Email",
        password: "Password",
        passwordConfirm: "Repeat password",
      ),
      register: AppLocalizations_Labels_Register(
        to: "Registration",
        title: "Sign Up",
        execute: "Sign Up",
      ),
    ),
    Locale.fromSubtags(languageCode: "ru"): L_Labels(
      requiredField: "Это поле обязательно к заполнению",
      invalidEmailFormat: "Неверный адрес электронной почты",
      passwordMatch: "Пароли не совпадают",
      unexpectedError: "Мы сожалеем. Неожиданная ошибка произошло: ((",
      view: "Посмотреть",
      save: "Сохранить",
      cancel: "Отмена",
      ok: "Хорошо",
      newListName: "Новое название списка",
      newItemName: "Новый пункт",
      yourLists: "Ваши списки",
      share: "Делиться",
      delete: "Удалить",
      deleteListConfirm: "Уверены, что хотите удалить этот список?",
      deleteItemConfirm: "Уверены, что хотите удалить этот пункт?",
      rename: "Rename",
      emptyListInfo1: "У вас нет какой-либо список покупок еще.",
      emptyListInfoClick: "щелчок",
      emptyListInfoClickToCreate: "чтобы создать новый.",
      emptyListInfoClickToShare: "делить содержимое списка покупок.",
      emptyListEnjoySharing: "Наслаждайтесь проверки списка тусовке",
      loginToAddList: ({name}) =>
          "Сваи разделили список ${name}. Войдите, чтобы его просмотреть",
      invitedInToLists: ({name}) => "Список ${name} был добавлен",
      emptyItemsListInfo1: "Ваш список покупок пуст.",
      emptyItemsListInfoClickToCreate: " добавлять новые элементы.",
      emptyItemsListInfoClickToShare: " разделить список покупок.",
      login: AppLocalizations_Labels_Login(
        title: "Авторизоваться",
        execute: "Авторизоваться",
        executeGoogle: "Вход с Google",
        executeFacebook: "Войти с Facebook",
      ),
      hint: AppLocalizations_Labels_Hint(
        email: "Эл. адрес",
        password: "Пароль",
        passwordConfirm: "Повторите пароль",
      ),
      register: AppLocalizations_Labels_Register(
        to: "Постановка на учет",
        title: "Зарегистрироваться",
        execute: "Зарегистрироваться",
      ),
    ),
  };

  final L_Labels labels;

  static L_Labels of(BuildContext context) =>
      Localizations.of<L>(context, L)?.labels;
}

typedef String L_Labels_loginToAddList({@required String name});
typedef String L_Labels_invitedInToLists({@required String name});

class AppLocalizations_Labels_Login {
  const AppLocalizations_Labels_Login(
      {this.title, this.execute, this.executeGoogle, this.executeFacebook});

  final String title;

  final String execute;

  final String executeGoogle;

  final String executeFacebook;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      case 'execute':
        return execute;
      case 'executeGoogle':
        return executeGoogle;
      case 'executeFacebook':
        return executeFacebook;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Hint {
  const AppLocalizations_Labels_Hint(
      {this.email, this.password, this.passwordConfirm});

  final String email;

  final String password;

  final String passwordConfirm;

  String getByKey(String key) {
    switch (key) {
      case 'email':
        return email;
      case 'password':
        return password;
      case 'passwordConfirm':
        return passwordConfirm;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Register {
  const AppLocalizations_Labels_Register({this.to, this.title, this.execute});

  final String to;

  final String title;

  final String execute;

  String getByKey(String key) {
    switch (key) {
      case 'to':
        return to;
      case 'title':
        return title;
      case 'execute':
        return execute;
      default:
        return '';
    }
  }
}

class L_Labels {
  const L_Labels(
      {this.requiredField,
      this.invalidEmailFormat,
      this.passwordMatch,
      this.unexpectedError,
      this.view,
      this.save,
      this.cancel,
      this.ok,
      this.newListName,
      this.newItemName,
      this.yourLists,
      this.share,
      this.delete,
      this.deleteListConfirm,
      this.deleteItemConfirm,
      this.rename,
      this.emptyListInfo1,
      this.emptyListInfoClick,
      this.emptyListInfoClickToCreate,
      this.emptyListInfoClickToShare,
      this.emptyListEnjoySharing,
      L_Labels_loginToAddList loginToAddList,
      L_Labels_invitedInToLists invitedInToLists,
      this.emptyItemsListInfo1,
      this.emptyItemsListInfoClickToCreate,
      this.emptyItemsListInfoClickToShare,
      this.login,
      this.hint,
      this.register})
      : this._loginToAddList = loginToAddList,
        this._invitedInToLists = invitedInToLists;

  final String requiredField;

  final String invalidEmailFormat;

  final String passwordMatch;

  final String unexpectedError;

  final String view;

  final String save;

  final String cancel;

  final String ok;

  final String newListName;

  final String newItemName;

  final String yourLists;

  final String share;

  final String delete;

  final String deleteListConfirm;

  final String deleteItemConfirm;

  final String rename;

  final String emptyListInfo1;

  final String emptyListInfoClick;

  final String emptyListInfoClickToCreate;

  final String emptyListInfoClickToShare;

  final String emptyListEnjoySharing;

  final L_Labels_loginToAddList _loginToAddList;

  final L_Labels_invitedInToLists _invitedInToLists;

  final String emptyItemsListInfo1;

  final String emptyItemsListInfoClickToCreate;

  final String emptyItemsListInfoClickToShare;

  final AppLocalizations_Labels_Login login;

  final AppLocalizations_Labels_Hint hint;

  final AppLocalizations_Labels_Register register;

  String getByKey(String key) {
    switch (key) {
      case 'requiredField':
        return requiredField;
      case 'invalidEmailFormat':
        return invalidEmailFormat;
      case 'passwordMatch':
        return passwordMatch;
      case 'unexpectedError':
        return unexpectedError;
      case 'view':
        return view;
      case 'save':
        return save;
      case 'cancel':
        return cancel;
      case 'ok':
        return ok;
      case 'newListName':
        return newListName;
      case 'newItemName':
        return newItemName;
      case 'yourLists':
        return yourLists;
      case 'share':
        return share;
      case 'delete':
        return delete;
      case 'deleteListConfirm':
        return deleteListConfirm;
      case 'deleteItemConfirm':
        return deleteItemConfirm;
      case 'rename':
        return rename;
      case 'emptyListInfo1':
        return emptyListInfo1;
      case 'emptyListInfoClick':
        return emptyListInfoClick;
      case 'emptyListInfoClickToCreate':
        return emptyListInfoClickToCreate;
      case 'emptyListInfoClickToShare':
        return emptyListInfoClickToShare;
      case 'emptyListEnjoySharing':
        return emptyListEnjoySharing;
      case 'emptyItemsListInfo1':
        return emptyItemsListInfo1;
      case 'emptyItemsListInfoClickToCreate':
        return emptyItemsListInfoClickToCreate;
      case 'emptyItemsListInfoClickToShare':
        return emptyItemsListInfoClickToShare;
      default:
        return '';
    }
  }

  String loginToAddList({@required String name}) => this._loginToAddList(
        name: name,
      );
  String invitedInToLists({@required String name}) => this._invitedInToLists(
        name: name,
      );
}
