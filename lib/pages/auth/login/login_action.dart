import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/action_report.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/pages/auth/login/login_state.dart';

import 'do_after_login.dart';

class LoginInitAction extends Action {
  LoginInitAction({completer}) : super(completer, "LoginInitActionAction");

  @override
  AppState reduce() {
    return state.copyWith(loginState: LoginState.initial());
  }
}

class LoginLoadingAction extends Action {
  final bool loading;

  LoginLoadingAction({this.loading, completer})
      : super(completer, "LoginLoadingAction");

  @override
  AppState reduce() {
    final loadingState = state.loginState.copyWith(isLoading: loading);
    return state.copyWith(loginState: loadingState);
  }
}

class LoginEmailChangedAction extends Action {
  final String value;

  LoginEmailChangedAction({this.value, completer})
      : super(completer, "LoginEmailChangedAction");

  @override
  AppState reduce() {
    final loadingState = state.loginState.copyWith(email: value);
    return state.copyWith(loginState: loadingState);
  }
}

class LoginPasswordChangedAction extends Action {
  final String value;

  LoginPasswordChangedAction({this.value, completer})
      : super(completer, "LoginPasswordChangedAction");

  @override
  AppState reduce() {
    final loadingState = state.loginState.copyWith(password: value);
    return state.copyWith(loginState: loadingState);
  }
}

class LoginWithCredentialsAction extends Action {
  LoginWithCredentialsAction({completer})
      : super(completer, "LoginExecuteActionAction");

  @override
  void before() {
    store.dispatch(LoginLoadingAction(loading: true));
  }

  @override
  void after() {
    store.dispatch(LoginLoadingAction(loading: false));
  }

  @override
  FutureOr<AppState> reduce() async {
    final loginState = store.state.loginState;
    final email = loginState.email;
    final password = loginState.password;
    try {
      final user = await GetIt.I.get<AuthRepo>().login(email, password);
      print("signed in " + user.toString());
      doOnLoggedIn(store);
      completed(this);
    } catch (e) {
      print(e);
      catchException(this, e);
    }
    return state.copyWith(loginState: null);
  }
}

class LoginGoogleAction extends Action {
  LoginGoogleAction({completer}) : super(completer, "LoginGoogleAction");

  @override
  void before() {
    store.dispatch(LoginLoadingAction(loading: true));
  }

  @override
  void after() {
    store.dispatch(LoginLoadingAction(loading: false));
  }

  @override
  FutureOr<AppState> reduce() async {
    try {
      final user = await GetIt.I.get<AuthRepo>().loginWithGoogle();
      print("signed in " + user.toString());
      doOnLoggedIn(store);
      completed(this);
    } catch (e) {
      print(e);
      catchException(this, e);
    } finally {
      store.dispatch(LoginLoadingAction(loading: false));
    }
    return state.copyWith(loginState: null);
  }
}
