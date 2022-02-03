import 'package:flutter/material.dart';
import 'package:give_a_ride/data/entities/shopping_item.dart';
import 'package:give_a_ride/ui/widgets/reorderable_list_simple.dart';

import 'list_item_item.dart';
import 'user_lists_view.dart';

class ListItemList extends StatelessWidget {
  final List<ShoppingItem> items;
  final Function(ShoppingItem, bool) onItemChanged;
  final ItemAction<ShoppingItem> delete;
  final ItemAction<ShoppingItem> rename;
  final ReorderAction reorder;
  final bool reorderEnabled;

  const ListItemList({
    Key? key,
    required this.items,
    required this.delete,
    required this.rename,
    required this.onItemChanged,
    required this.reorder,
    required this.reorderEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListSimple(
      children: items
          .map((e) => ListItemItem(
                e,
                delete,
                rename,
                onItemChanged,
                reorderEnabled,
                key: ValueKey(e),
              ))
          .toList(),
      onReorder: (int o, int n) => reorder(items[o], o, n),
    );
  }
}
