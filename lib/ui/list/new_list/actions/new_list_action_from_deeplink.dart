import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/invites_repo.dart';
import 'package:shopping_list/deeplinks/deeplink.dart';
import 'package:shopping_list/state/app_state.dart';

import 'new_list_action_add_from_invites.dart';

class NewListActionFromDeepLink extends ReduxAction<AppState> {
  final Map<String, String> params;

  NewListActionFromDeepLink({required this.params});

  @override
  Future<AppState?> reduce() async {
    final id = ArgumentError.checkNotNull(params[idKey]);
    final name = ArgumentError.checkNotNull(params[nameKey]);

    final authRepo = GetIt.I.get<AuthRepo>();
    final invitesRepos = GetIt.I.get<InviteRepos>();

    await invitesRepos.saveInvite(id, name);
    final loggedIn = await authRepo.isAuthorized();
    if (loggedIn) {
      dispatch(NewListActionAddFromInvite());
      return null;
    } else {
      return state.copyWith(loginToViewList: Event(name));
    }
  }
}
