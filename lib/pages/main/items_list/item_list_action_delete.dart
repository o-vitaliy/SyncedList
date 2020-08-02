import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/utils/expandable_list.dart';

import 'item_list_state.dart';

class ItemListActionDelete extends ReduxAction<ItemListState> {
  final ShoppingItem item;

  ItemListActionDelete(this.item);

  @override
  ItemListState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();

    repo.deleteItem(state.list.id, item.id);

    return null;
  }
}
