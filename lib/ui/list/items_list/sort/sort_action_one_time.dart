import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/data/repos/sort_repo.dart';
import 'package:shopping_list/data/repos/user_lists_repo.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:collection/collection.dart';

class SortActionOneTime extends ReduxAction<AppState> {
  final ItemSort sort;

  SortActionOneTime(this.sort);

  @override
  Future<AppState> reduce() async {
    final repo = GetIt.I.get<ItemsListRepo>();

    await GetIt.I.get<SortRepo>().clear();

    final items = ItemSortHelper.sort(sort, state.itemListState!.items);
    final changes = <String, int>{};

    items.forEachIndexed((i, e) => changes[e.id] = i);
    repo.orderItem(state.itemListState!.list.id, changes);

    final s = state.itemListState!.copyWith(
      items: items,
    );
    return state.copyWith(itemListState: s, sorts: []);
  }
}
