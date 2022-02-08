import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/state/app_state.dart';

const String waitLoginAction = "waitLoginAction";

abstract class BaseLogin extends ReduxAction<AppState> {
  Future login();

  @override
  Future<AppState> reduce() async {
    try {
      await login();
      dispatch(NavigateAction.pushNamed("/main"));

      final loginState = state.loginState.copy(authorized: true);

      return state.copyWith(loginState: loginState);
    } on FirebaseException catch (e) {
      throw UserException(e.message ?? "Some thing went wrong");
    }
  }

  @override
  void before() => dispatch(WaitAction.add(waitLoginAction));

  @override
  void after() => dispatch(WaitAction.remove(waitLoginAction));
}
