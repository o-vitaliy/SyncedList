import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/invites_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/inviting/invite_args.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/sort_action_init.dart';

void doOnLoggedIn(Store store) async {
  store.dispatch(SortActionInit());
  final invitesRepos = GetIt.I.get<InviteRepos>();
  UserList item = await invitesRepos.first();
  if (item != null) {
    store.dispatch(NavigateAction<AppState>.pushReplacementNamed(
      "/invite",
      arguments: InviteArgs(item.id, item.name),
    ));
  } else {
    store.dispatch(NavigateAction<AppState>.pushReplacementNamed("/main"));
  }
}
