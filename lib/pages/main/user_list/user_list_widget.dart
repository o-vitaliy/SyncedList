import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/widgets/reorderable_list_simple.dart';

import 'user_list_item_widget.dart';
import 'user_lists_view.dart';

class UserListsWidget extends StatelessWidget {
  final List<UserList> items;

  final ItemAction<UserList> share;
  final ItemAction<UserList> delete;
  final ItemAction<UserList> rename;
  final ReorderAction reorder;

  const UserListsWidget(
      {Key key, this.items, this.share, this.delete, this.rename, this.reorder})
      : super(key: key);

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
    if (item == null) {
      return SizedBox.shrink();
    }
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
