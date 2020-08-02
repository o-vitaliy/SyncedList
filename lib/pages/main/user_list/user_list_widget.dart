import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/user_list.dart';

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
    return ReorderableListView(
      children: items.map((e) => _listItem(context, e)).toList(growable: false),
      onReorder: (oldPos, newPos) {
        reorder(items[oldPos], oldPos, newPos);
      },
      padding: const EdgeInsets.all(8.0),
    );
  }

  Widget _listItem(BuildContext context, UserList item) {
    if (item == null) {
      return SizedBox.shrink();
    }
    return UserListItemWidget(
      key: ValueKey(item),
      item: item,
      share: share,
      delete: delete,
      rename: rename,
    );
  }
}
