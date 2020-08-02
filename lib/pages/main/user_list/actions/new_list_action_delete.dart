import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';

import 'new_list_action_update_list.dart';

class UserListActionDelete extends ReduxAction<AppState> {
  final UserList item;

  UserListActionDelete(this.item);

  @override
  Future<AppState> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();
    await repo.deleteUserList(item);
    return null;
  }

  @override
  void after() {
    dispatch(UserListActionUpdateList());
  }
}
