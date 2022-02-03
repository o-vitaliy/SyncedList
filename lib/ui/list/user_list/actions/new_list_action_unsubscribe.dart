import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/repos/lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';

class UserListActionUnsubscribe extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();
    repo.unsubscribeItems();
    return null;
  }
}
