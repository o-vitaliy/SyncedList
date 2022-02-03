import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/repos/user_lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';
import 'package:collection/collection.dart';

class ItemListActionReorder extends ReduxAction<AppState> {
  final int oldPos;
  final int newPos;

  ItemListActionReorder(this.oldPos, this.newPos);

  @override
  AppState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();

    final itemListState = state.itemListState!;
    final items = itemListState.items.toList();

    final item = items.removeAt(oldPos);
    items.insert(newPos, item);

    final start = min(oldPos, newPos);
    final end = max(oldPos, newPos) + 1;

    final listId = itemListState.list.id;
    final changes = <String, int>{};

    items
        .sublist(start, end)
        .forEachIndexed((i, e) => changes[e.id] = start + i);

    repo.orderItem(listId, changes);

    final s = itemListState.copyWith(
      items: items.toList(growable: false),
    );
    return state.copyWith(itemListState: s);
  }
}
