import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/models/user_list.dart';

class UserListActionListChange extends ReduxAction<AppState> {
  final List<UserList> list;

  UserListActionListChange(this.list);

  @override
  FutureOr<AppState> reduce() {
    final userListState =
        state.userListState.copyWith(list: list, loading: false);
    return state.copyWith(userListState: userListState);
  }
}
