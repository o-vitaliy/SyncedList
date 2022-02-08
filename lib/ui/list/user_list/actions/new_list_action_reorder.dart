import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class UserListActionReorder extends ReduxAction<AppState> {
  final int oldPos;
  final int newPos;

  UserListActionReorder(this.oldPos, this.newPos);

  @override
  Future<AppState> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();

    final items = state.userListState!.list.toList();

    final item = items.removeAt(oldPos);
    items.insert(newPos, item);

    final start = min(oldPos, newPos);
    final end = max(oldPos, newPos) + 1;

    final changes = <String, int>{};

    items
        .sublist(start, end)
        .forEachIndexed((i, e) => changes[e.id] = start + i);

    repo.orderList(changes);

    return state.copyWith(
      userListState: state.userListState!.copyWith(list: items),
    );
  }
}
