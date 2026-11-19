import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/state/write_errors.dart';

class UserListActionDelete extends ReduxAction<AppState> {
  final UserList item;

  UserListActionDelete(this.item);

  @override
  Future<AppState?> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();
    reportWriteFailure(repo.deleteUserList(item));
    return null;
  }
}
