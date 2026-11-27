import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/data/repos/suggestions_repo.dart';
import 'package:shopping_list/data/repos/user_lists_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class AccountActionSignOut extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    // Stop listening first: after sign-out these queries would be rejected.
    GetIt.I.get<ListsRepo>().unsubscribeItems();
    GetIt.I.get<ItemsListRepo>().unsubscribeItems();

    try {
      // While still signed in, so this install's device doc can be removed.
      await GetIt.I.get<PushRepo>().signOut();
      await GetIt.I.get<AuthRepo>().signOut();
    } on FirebaseException catch (e) {
      throw UserException(e.message ?? "Some thing went wrong");
    } catch (e) {
      throw UserException("Some thing went wrong", reason: "$e");
    }
    // Item names are the signed-out user's; don't suggest them to the next.
    await GetIt.I.get<SuggestionsRepo>().clear();
    dispatch(NavigateAction.pushNamedAndRemoveAll("/login"));
    return state.signedOut();
  }
}
