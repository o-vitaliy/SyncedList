import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';
import 'package:shared_shopping_list/utils/expandable_list.dart';

import 'item_list_state.dart';

class ItemListActionReorder extends ReduxAction<ItemListState> {
  final int oldPos;
  final int newPos;

  ItemListActionReorder(this.oldPos, this.newPos);

  @override
  ItemListState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();

    final newP = oldPos < newPos ? newPos - 1 : newPos;

    final items = state.items.toList();

    final item = items.removeAt(oldPos);
    items.insert(newP, item);

    final start = min(oldPos, newP);
    final end = max(oldPos, newP) + 1;

    final listId = state.list.id;
    final reorderTasks = items
        .sublist(start, end)
        .mapIndex((e, i) => repo.orderItem(listId, e.id, start + i));

    Future.wait(reorderTasks);

    return state.copyWith(
      items: items,
    );
  }
}
