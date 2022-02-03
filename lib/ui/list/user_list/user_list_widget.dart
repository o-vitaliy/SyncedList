import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/ui/widgets/reorderable_list_simple.dart';

import 'user_list_item_widget.dart';
import 'user_lists_view.dart';

class UserListsWidget extends StatelessWidget {
  final List<UserList> items;

  final ItemAction<UserList> share;
  final ItemAction<UserList> delete;
  final ItemAction<UserList> rename;
  final ReorderAction reorder;

  const UserListsWidget({
    Key? key,
    required this.items,
    required this.share,
    required this.delete,
    required this.rename,
    required this.reorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListSimple(
      children: items.map((e) => _listItem(context, e)).toList(growable: false),
      onReorder: (oldPos, newPos) {
        reorder(items[oldPos], oldPos, newPos);
      },
    );
  }

  Widget _listItem(BuildContext context, UserList item) {
    return ReorderableListener(
        child: UserListItemWidget(
      key: ValueKey(item),
      item: item,
      share: share,
      delete: delete,
      rename: rename,
    ));
  }
}
