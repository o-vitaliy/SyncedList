import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/data/repos/user_lists_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class AccountActionSignOut extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    // Stop listening first: after sign-out these queries would be rejected.
    GetIt.I.get<ListsRepo>().unsubscribeItems();
    GetIt.I.get<ItemsListRepo>().unsubscribeItems();

    await GetIt.I.get<AuthRepo>().signOut();
    dispatch(NavigateAction.pushNamedAndRemoveAll("/login"));
    return state.signedOut();
  }
}
