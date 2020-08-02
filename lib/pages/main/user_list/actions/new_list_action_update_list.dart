import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/models/user_list.dart';

class UserListActionUpdateList extends ReduxAction<AppState> {
  final List<UserList> items;

  UserListActionUpdateList(this.items);

  @override
  FutureOr<AppState> reduce() async {
    final list = items..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    final s = state.userListState.copyWith(loading: false, list: list);
    return state.copyWith(userListState: s);
  }
}
