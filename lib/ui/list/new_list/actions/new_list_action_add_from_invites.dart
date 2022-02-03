import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/data/repos/invites_repo.dart';
import 'package:give_a_ride/data/repos/lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';

class NewListActionAddFromInvite extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    AppState appState = state;

    final userList = GetIt.I.get<ListsRepo>();
    final invitesRepos = GetIt.I.get<InviteRepos>();

    final names = <String>[];
    UserList? item = await invitesRepos.first();
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
}
