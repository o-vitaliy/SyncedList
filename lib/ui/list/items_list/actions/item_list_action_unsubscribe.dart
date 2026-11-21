import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/repos/user_lists_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class ItemListActionUnsubscribe extends ReduxAction<AppState> {
  /// The list the closing screen opened. When a push replaces one list
  /// screen with another, the new screen subscribes before the old one is
  /// disposed, so the old one must leave the new subscription alone.
  final UserList list;

  ItemListActionUnsubscribe(this.list);

  @override
  AppState? reduce() {
    if (!identical(state.itemListState?.list, list)) return null;
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.unsubscribeItems();
    return state.withoutItemList();
  }
}
