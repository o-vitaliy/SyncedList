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

    final items = state.items.toList();

    final item = items.removeAt(oldPos);
    items.insert(newPos, item);

    final start = min(oldPos, newPos);
    final end = max(oldPos, newPos) + 1;

    final listId = state.list.id;
    final changes = Map<String, int>();

    items.sublist(start, end)
        .forEachIndex((e, i) => changes[e.id] = start + i);

    repo.orderItem(listId, changes);

    return state.copyWith(
      items: items,
    );
  }
}
