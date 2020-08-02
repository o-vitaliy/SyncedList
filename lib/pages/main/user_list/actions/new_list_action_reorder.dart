import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';
import 'package:shared_shopping_list/utils/expandable_list.dart';

class UserListActionReorder extends ReduxAction<AppState> {
  final int oldPos;
  final int newPos;

  UserListActionReorder(this.oldPos, this.newPos);

  @override
  Future<AppState> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();

    final items = state.userListState.list.toList();

    final newP = min(newPos, items.length - 1);

    final item = items.removeAt(oldPos);
    items.insert(newP, item);

    final start = min(oldPos, newP);
    final end = max(oldPos, newP) + 1;

    final changes = Map<String, int>();

    items.sublist(start, end)
        .forEachIndex((e, i) => changes[e.id] = start + i);

    repo.orderList(changes);

    return state.copyWith(
      userListState: state.userListState.copyWith(list: items),
    );
  }
}
