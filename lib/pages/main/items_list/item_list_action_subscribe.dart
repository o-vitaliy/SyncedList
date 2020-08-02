import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';

import 'item_list_action_change_list.dart';
import 'item_list_state.dart';

class ItemListActionSubscribe extends ReduxAction<ItemListState> {
  @override
  ItemListState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.subscribeItems(
        state.list.id, (items) => dispatch(ItemListActionChangeList(items)));

    return null;
  }
}
