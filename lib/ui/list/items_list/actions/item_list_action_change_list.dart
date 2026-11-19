import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/data/entities/shopping_item.dart';
import 'package:shopping_list/data/repos/sort_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class ItemListActionChangeList extends ReduxAction<AppState> {
  final List<ShoppingItem> items;

  final String listId;

  ItemListActionChangeList(this.listId, this.items);

  @override
  Future<AppState?> reduce() async {
    final sortRepo = GetIt.I.get<SortRepo>();
    final sort = await sortRepo.getSort();

    List<ShoppingItem> result = items;
    if (sort != null) {
      result = ItemSortHelper.sort(sort, items);
    } else {
      result = items.toList()..sort((a, b) => a.order.compareTo(b.order));
    }

    // The list may have been closed or switched while sort prefs were loading.
    final itemListState = state.itemListState;
    if (itemListState == null || itemListState.list.id != listId) return null;

    return state.copyWith(
      itemListState: itemListState.copyWith(loading: false, items: result),
    );
  }
}
