import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';

import '/state/app_state.dart';

class CheckLoginAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final authDataSource = GetIt.I.get<AuthRepo>();
    final authorized = await authDataSource.isAuthorized();

    final loginState = state.loginState.copy(authorized: authorized);

    return state.copyWith(loginState: loginState);
  }

  @override
  void after() {
    if (state.loginState.authorized == true) {
      dispatch(NavigateAction.pushReplacementNamed("/main"));
    } else {
      dispatch(NavigateAction.pushReplacementNamed("/login"));
    }
  }
}
