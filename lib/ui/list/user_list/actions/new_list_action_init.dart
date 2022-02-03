import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:give_a_ride/state/app_state.dart';
import 'package:give_a_ride/state/user_list_state.dart';

class UserListActionInit extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copyWith(userListState: UserListState.initial());
  }
}
