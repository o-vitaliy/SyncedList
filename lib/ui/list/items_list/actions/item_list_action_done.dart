import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/entities/shopping_item.dart';
import 'package:give_a_ride/data/repos/user_lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';

class ItemListActionDone extends ReduxAction<AppState> {
  final ShoppingItem item;
  final bool done;

  ItemListActionDone(this.item, this.done);

  @override
  AppState reduce() {
    final itemListState = state.itemListState!;
    final items = itemListState.items.map((e) {
      if (e.id == item.id) {
        return e.copyWith(done: done);
      } else {
        return e;
      }
    });
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.changeItemDone(itemListState.list.id, item.id, done);
    final s = itemListState.copyWith(
      items: items.toList(growable: false),
    );
    return state.copyWith(itemListState: s);
  }
}
