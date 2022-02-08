import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/state/user_list_state.dart';

class UserListActionInit extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copyWith(userListState: UserListState.initial());
  }
}
