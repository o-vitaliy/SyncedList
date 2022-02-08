import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/state/user_list_state.dart';

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
