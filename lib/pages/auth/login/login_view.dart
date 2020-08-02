import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/action_report.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/validators/email_validator.dart';
import 'package:shared_shopping_list/data/validators/empty_validator.dart';
import 'package:shared_shopping_list/localizations.dart';
import 'package:shared_shopping_list/widgets/scroll_column_expandable.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'login_action.dart';

class LoginView extends StatelessWidget {
  LoginView();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final title = L.of(context).loginTitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StoreConnector<AppState, _ViewModel>(
          converter: _ViewModel.fromStore,
          onDidChange: (vm) => modelChanged(context, vm),
          onInit: (store) => store.dispatch(LoginInitAction()),
          builder: _content),
    );
  }

  Widget _content(final BuildContext context, _ViewModel vm) {
    return Stack(children: [
      Form(
        key: _formKey,
        child: ScrollColumnExpandable(
          padding: EdgeInsets.all(8),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              validator: (value) => _emailValidation(context, value),
              onChanged: vm.emailChange,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: L.of(context).emailHint),
            ),
            defaultSpacer(),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              onChanged: vm.passwordChange,
              validator: (value) => _passwordValidation(context, value),
              decoration: InputDecoration(hintText: L.of(context).passwordHint),
            ),
            defaultSpacer(),
            RaisedButton(
              onPressed: () => doLogin(context, vm),
              child: Text(L.of(context).doLogin),
            ),
            defaultSpacer(),
            defaultSpacer(),
            RaisedButton(
              onPressed: () => doLoginWithGoogle(context, vm),
              child: Text(L.of(context).doLoginWithGoogle),
            ),
            defaultSpacer(),
            RaisedButton(
              onPressed: () => doLoginWithFacebook(context, vm),
              child: Text(L.of(context).doLoginWithFacebook),
            ),
            Spacer(),
            FlatButton(
              onPressed: () => openSingUp(context),
              child: Text(L.of(context).toRegistration),
            ),
          ],
        ),
      ),
      if (vm.loading) LoadingIndicator()
    ]);
  }

  String _emailValidation(BuildContext context, String value) {
    final error = EmptyValidator().valid(value, "requiredField") ??
        EmailValidator().valid(value, "invalidEmailFormat");
    if (error != null) {
      return L.of(context).get(error);
    }
    return null;
  }

  String _passwordValidation(BuildContext context, String value) {
    final error = EmptyValidator().valid(value, "requiredField");
    if (error != null) {
      return L.of(context).get(error);
    }
    return null;
  }

  void doLogin(BuildContext context, _ViewModel vm) {
    if (!_formKey.currentState.validate()) return;
    var completer = Completer<ActionReport>();
    completer.future.then((value) {
      if (value.status == RequestStatus.error) {
        showSnack(context, value.msg);
      }
    });
    vm.loginCredentials(completer);
  }

  void doLoginWithGoogle(BuildContext context, _ViewModel vm) {
    var completer = Completer<ActionReport>();
    completer.future.then((value) {
      if (value.status == RequestStatus.error) {
        showSnack(context, value.msg);
      }
    });
    vm.loginGoogle(completer);
  }

  void doLoginWithFacebook(BuildContext context, _ViewModel vm) {
    var completer = Completer<ActionReport>();
    completer.future.then((value) {
      if (value.status == RequestStatus.error) {
        showSnack(context, value.msg);
      }
    });
    vm.loginFacebook(completer);
  }

  void openSingUp(BuildContext context) {
    Navigator.of(context).pushNamed("/registration");
  }

  void modelChanged(BuildContext context, _ViewModel vm) {
    final invite = vm.inviteEvent.consume();
    if (invite != null) {
      defaultToast(L.of(context).loginToAddList(invite));
    }
  }
}

class _ViewModel {
  final bool loading;
  final Function(String) emailChange;
  final Function(String) passwordChange;
  final Function(Completer) loginCredentials;
  final Function(Completer) loginGoogle;
  final Function(Completer) loginFacebook;
  final Event<String> inviteEvent;

  _ViewModel({
    @required this.loading,
    @required this.emailChange,
    @required this.passwordChange,
    @required this.loginCredentials,
    @required this.loginGoogle,
    @required this.loginFacebook,
    @required this.inviteEvent,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    final usernameChange =
        (v) => store.dispatch(LoginEmailChangedAction(value: v));
    final passwordChange =
        (v) => store.dispatch(LoginPasswordChangedAction(value: v));
    final loginCredentials =
        (c) => store.dispatch(LoginWithCredentialsAction(completer: c));
    final loginGoogle = (c) => store.dispatch(LoginGoogleAction(completer: c));
    final loginFacebook =
        (c) => store.dispatch(LoginFacebookAction(completer: c));
    return _ViewModel(
      loading: store.state.loginState.isLoading,
      emailChange: usernameChange,
      passwordChange: passwordChange,
      loginCredentials: loginCredentials,
      loginGoogle: loginGoogle,
      loginFacebook: loginFacebook,
      inviteEvent: store.state.loginToViewList,
    );
  }
}
