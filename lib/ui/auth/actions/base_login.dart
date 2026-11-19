import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/data/sources/auth/auth_datasource.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/list/new_list/actions/new_list_action_add_from_invites.dart';

abstract class BaseLogin extends ReduxAction<AppState> {
  Future login();

  @override
  Future<AppState?> reduce() async {
    try {
      await login();
      // Join lists from share links opened before signing in.
      dispatch(NewListActionAddFromInvite());
      dispatch(NavigateAction.pushReplacementNamed("/main"));

      final loginState = state.loginState.copy(authorized: true);

      return state.copyWith(loginState: loginState);
    } on LoginCancelled {
      return null;
    } on FirebaseException catch (e) {
      throw UserException(e.message ?? "Some thing went wrong");
    }
  }
}
