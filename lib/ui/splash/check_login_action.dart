import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import '/data/auth/auth_datasource.dart';
import '/state/app_state.dart';
import '/state/login_state.dart';

class CheckLoginAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final authDataSource = GetIt.I.get<AuthDataSource>();
    final authorized = await authDataSource.isAuthorized();

    final loginState = state.loginState.copy(authorized: authorized);

    return state.copy(loginState: loginState);
  }

  @override
  void after() {
    if (state.loginState.authorized == true) {
      dispatch(NavigateAction.pushNamed("/main"));
    } else {
      dispatch(NavigateAction.pushNamed("/login"));
    }
  }
}
