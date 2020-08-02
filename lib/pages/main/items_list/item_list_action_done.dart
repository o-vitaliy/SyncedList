import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

import 'item_list_state.dart';

class ItemListActionDone extends ReduxAction<ItemListState> {
  final ShoppingItem item;
  final bool done;

  ItemListActionDone(this.item, this.done);

  @override
  ItemListState reduce() {
    final items = state.items.map((e) {
      if (e.id == item.id)
        return e.copyWith(done: done);
      else
        return e;
    });
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.changeItemDone(state.list.id, item, done);
    return state.copyWith(items: items.toList(growable: false));
  }
}
