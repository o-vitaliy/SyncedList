import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:give_a_ride/app_state.dart';

class CheckLoginAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    await Future.delayed(const Duration(seconds: 1));
    return state.copy(authorized: true);
  }

  @override
  void after() {
    dispatch(NavigateAction.pushNamed("/login"));
  }
}
