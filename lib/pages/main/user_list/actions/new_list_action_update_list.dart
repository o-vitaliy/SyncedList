import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';

class UserListActionUpdateList extends ReduxAction<AppState> {
  @override
  FutureOr<AppState> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();
    final list = await repo.getUserLists()
      ..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    final s = state.userListState.copyWith(loading: false, list: list);
    return state.copyWith(userListState: s);
  }
}
