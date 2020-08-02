import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/pages/auth/login/do_after_login.dart';

class SplashInitAction extends ReduxAction<AppState> {
  @override
  FutureOr<AppState> reduce() async {
    final loggedIn = await GetIt.I.get<AuthRepo>().loggedIn();
    if (!loggedIn) {
      dispatch(NavigateAction<AppState>.pushReplacementNamed("/login"));
    } else {
      doOnLoggedIn(store);
    }
    return null;
  }
}
