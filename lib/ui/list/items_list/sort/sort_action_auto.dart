import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/data/repos/sort_repo.dart';
import 'package:shopping_list/state/app_state.dart';

import '../actions/item_list_action_change_list.dart';

class SortActionAuto extends ReduxAction<AppState> {
  final ItemSort sort;
  final bool enabled;

  SortActionAuto(this.sort, this.enabled);

  @override
  Future<AppState> reduce() async {
    final repo = GetIt.I.get<SortRepo>();

    if (enabled) {
      await repo.addSort(sort);
    } else {
      await repo.removeSort(sort);
    }

    final sorts = await repo.getList();
    return state.copyWith(sorts: sorts.toList(growable: true));
  }

  @override
  void after() {
    dispatch(ItemListActionChangeList(state.itemListState?.items ?? []));
  }
}
