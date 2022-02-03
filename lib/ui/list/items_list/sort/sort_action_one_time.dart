import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/entities/item_sort.dart';
import 'package:give_a_ride/data/repos/sort_repo.dart';
import 'package:give_a_ride/data/repos/user_lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';
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
