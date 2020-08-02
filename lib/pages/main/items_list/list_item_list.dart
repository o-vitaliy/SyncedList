import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';

import 'list_item_item.dart';

class ListItemList extends StatelessWidget {
  final List<ShoppingItem> items;
  final Function(ShoppingItem, bool) onItemChanged;
  final ReorderAction reorder;

  const ListItemList(this.items, this.onItemChanged, this.reorder, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: items
          .map((e) => ListItemItem(
                e,
                onItemChanged,
                key: ValueKey(e),
              ))
          .toList(),
      onReorder: (int o, int n) => reorder(items[o], o, n),
    );
  }
}
