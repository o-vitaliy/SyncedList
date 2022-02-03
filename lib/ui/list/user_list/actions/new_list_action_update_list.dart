import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/state/app_state.dart';
import 'package:give_a_ride/state/user_list_state.dart';

class UserListActionUpdateList extends ReduxAction<AppState> {
  final List<UserList> items;

  UserListActionUpdateList(this.items);

  @override
  Future<AppState> reduce() async {
    final list = items..sort((a, b) => (a.order).compareTo(b.order));
    final s = state.userListState?.copyWith(loading: false, list: list) ??
        UserListState(loading: false, list: list);
    return state.copyWith(userListState: s);
  }
}
