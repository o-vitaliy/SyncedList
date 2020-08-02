import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';

class UserListActionUnsubscribe extends ReduxAction<AppState> {
  @override
  FutureOr<AppState> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();
    repo.unsubscribeItems();
    return null;
  }
}
