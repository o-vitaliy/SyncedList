import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/invites_repo.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_update_list.dart';

class NewListActionAddFromInvite extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    AppState appState = state;

    final userList = GetIt.I.get<ListsRepo>();
    final invitesRepos = GetIt.I.get<InviteRepos>();

    final names = List<String>();
    UserList item = await invitesRepos.first();
    while (item != null) {
      try {
        await userList.addUserList(item.id);
        await invitesRepos.remove(item.id);
        names.add(item.name);
        item = await invitesRepos.first();
      } catch (e) {
        print(e);
        break;
      }
    }
    if (names.isNotEmpty) {
      return appState.copyWith(joinedToList: Event(names));
    }
    return null;
  }

  @override
  void after() {
    dispatch(UserListActionUpdateList());
  }
}
