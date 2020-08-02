import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';

import 'list_item_item.dart';

class ListItemList extends StatelessWidget {
  final List<ShoppingItem> items;
  final Function(ShoppingItem, bool) onItemChanged;
  final ItemAction<ShoppingItem> delete;
  final ItemAction<ShoppingItem> rename;
  final ReorderAction reorder;

  const ListItemList({
    Key key,
    @required this.items,
    @required this.delete,
    @required this.rename,
    @required this.onItemChanged,
    @required this.reorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: items
          .map((e) => ListItemItem(
                e,
                delete,
                rename,
                onItemChanged,
                key: ValueKey(e),
              ))
          .toList(),
      onReorder: (int o, int n) => reorder(items[o], o, n),
    );
  }
}
