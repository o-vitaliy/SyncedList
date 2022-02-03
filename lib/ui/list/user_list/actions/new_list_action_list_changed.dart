import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/data/repos/lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';

class UserListActionListChange extends ReduxAction<AppState> {
  final List<UserList> list;

  UserListActionListChange(this.list);

  @override
  AppState reduce() {
    final userListState = state.userListState!.copyWith(
      list: list,
      loading: false,
    );
    return state.copyWith(userListState: userListState);
  }
}
