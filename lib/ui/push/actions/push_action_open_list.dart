import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/list/items_list/item_list_view.dart';

/// Opens the list a tapped push was about, on top of the lists screen.
class PushActionOpenList extends ReduxAction<AppState> {
  final String listId;

  PushActionOpenList(this.listId);

  @override
  Future<AppState?> reduce() async {
    if (state.loginState.authorized != true) {
      // Still on the splash screen (or signed out): CheckLoginAction opens it
      // once the lists screen is up.
      GetIt.I.get<PushRepo>().pendingListId = listId;
      return null;
    }

    final list = await GetIt.I.get<ListsRepo>().getList(listId);
    if (list == null) return null;

    // Replaces any open list; ListItemsView only unsubscribes the list it
    // opened, so the new screen keeps its subscription.
    dispatch(
      NavigateAction.pushNamedAndRemoveUntil(
        ListItemsView.routeName(list),
        (route) => route.settings.name == "/main",
        arguments: list,
      ),
    );
    return null;
  }
}
