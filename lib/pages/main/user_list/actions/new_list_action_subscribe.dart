import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';

import 'new_list_action_update_list.dart';

class UserListActionSubscribe extends ReduxAction<AppState> {
  final Object observer;

  UserListActionSubscribe(this.observer);

  @override
  AppState reduce() {
    final repo = GetIt.I.get<ListsRepo>();
    repo.subscribeLists(
      observer,
      (items) => dispatch(UserListActionUpdateList(items)),
    );
    return null;
  }
}
