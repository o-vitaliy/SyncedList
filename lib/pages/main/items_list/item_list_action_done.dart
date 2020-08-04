import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

class ItemListActionDone extends ReduxAction<AppState> {
  final ShoppingItem item;
  final bool done;

  ItemListActionDone(this.item, this.done);

  @override
  AppState reduce() {
    final itemListState = state.itemListState;
    final items = itemListState.items.map((e) {
      if (e.id == item.id)
        return e.copyWith(done: done);
      else
        return e;
    });
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.changeItemDone(itemListState.list.id, item.id, done);
    final s = state.itemListState.copyWith(
      items: items.toList(growable: false),
    );
    return state.copyWith(itemListState: s);
  }
}
