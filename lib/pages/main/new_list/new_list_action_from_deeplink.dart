import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/deeplinks/deeplink.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/data/repos/invites_repo.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_update_list.dart';

import 'new_list_action_add_from_invites.dart';

class NewListActionFromDeepLink extends ReduxAction<AppState> {
  final Map<String, String> params;

  NewListActionFromDeepLink({this.params});

  @override
  Future<AppState> reduce() async {
    final id = params[idKey];
    final name = params[nameKey];

    final authRepo = GetIt.I.get<AuthRepo>();
    final invitesRepos = GetIt.I.get<InviteRepos>();

    await invitesRepos.saveInvite(id, name);
    final loggedIn = await authRepo.loggedIn();
    if (loggedIn) {
      dispatch(NewListActionAddFromInvite());
      return null;
    } else {
      return state.copyWith(loginToViewList: Event(name));
    }
  }

  @override
  void after() {
    dispatch(UserListActionUpdateList());
  }
}
