import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/action_report.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/pages/auth/login/do_after_login.dart';
import 'package:shared_shopping_list/pages/auth/singup/register_state.dart';

class RegisterInitAction extends Action {
  RegisterInitAction({completer})
      : super(completer, "RegisterInitActionAction");

  @override
  AppState reduce() {
    return state.copyWith(registerState: RegisterState.initial());
  }
}

class RegisterLoadingAction extends Action {
  final bool loading;

  RegisterLoadingAction({this.loading, completer})
      : super(completer, "RegisterLoadingActionAction");

  @override
  AppState reduce() {
    final registerState = state.registerState.copyWith(isLoading: loading);
    return state.copyWith(registerState: registerState);
  }
}

class RegisterEmailChangedAction extends Action {
  final String value;

  RegisterEmailChangedAction({this.value, completer})
      : super(completer, "RegisterEmailChangedAction");

  @override
  AppState reduce() {
    final registerState = state.registerState.copyWith(email: value);
    return state.copyWith(registerState: registerState);
  }
}

class RegisterPasswordChangedAction extends Action {
  final String value;

  RegisterPasswordChangedAction({this.value, completer})
      : super(completer, "RegisterPasswordChangedAction");

  @override
  AppState reduce() {
    final registerState = state.registerState.copyWith(password: value);
    return state.copyWith(registerState: registerState);
  }
}

class RegisterPasswordConfirmChangedAction extends Action {
  final String value;

  RegisterPasswordConfirmChangedAction({this.value, completer})
      : super(completer, "RegisterPasswordChangedAction");

  @override
  AppState reduce() {
    final registerState = state.registerState.copyWith(passwordConfirm: value);
    return state.copyWith(registerState: registerState);
  }
}

class RegisterExecuteAction extends Action {
  RegisterExecuteAction({completer})
      : super(completer, "RegisterExecuteActionAction");

  @override
  void before() {
    store.dispatch(RegisterLoadingAction(loading: true));
  }

  @override
  void after() {
    store.dispatch(RegisterLoadingAction(loading: false));
  }

  @override
  FutureOr<AppState> reduce() async {
    final loginState = store.state.registerState;
    final email = loginState.email;
    final password = loginState.password;
    try {
      final user = await GetIt.I.get<AuthRepo>().signUp(email, password);
      print("signed in " + user.toString());
      doOnLoggedIn(store);
      completed(this);
    } catch (e) {
      print(e);
      catchException(this, e);
    }
    return state.copyWith(registerState: null);
  }
}
