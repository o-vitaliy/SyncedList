import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/items_list/list_item_item.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';

import '../choice.dart';

class UserListItemWidget extends StatelessWidget {
  final UserList item;

  final ItemAction<UserList> share;
  final ItemAction<UserList> delete;
  final ItemAction<UserList> rename;

  const UserListItemWidget({
    @required Key key,
    @required this.item,
    @required this.share,
    @required this.delete,
    @required this.rename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Expanded(child: Text(item.name)),
            if (item.shared) shareIcon(),
            ReorderableListener(child: dragIcon),
            PopupMenuButton<Choice>(
              onSelected: (v) => v.action(),
              itemBuilder: (BuildContext context) {
                return getChoices(context, item)
                    .map(buildMoreMenuItem)
                    .toList();
              },
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/items", arguments: item);
      },
    ));
  }

  PopupMenuItem<Choice> buildMoreMenuItem(Choice choice) {
    return PopupMenuItem<Choice>(
      value: choice,
      child: Row(
        children: [
          Icon(choice.icon),
          Text(choice.title),
        ],
      ),
    );
  }

  List<Choice> getChoices(BuildContext context, UserList item) {
    final l = L.of(context);
    return [
      Choice(
        title: l.share,
        icon: Icons.share,
        action: () => share(context, item),
      ),
      Choice(
        title: l.delete,
        icon: Icons.delete,
        action: () => delete(context, item),
      ),
      Choice(
        title: l.rename,
        icon: Icons.edit,
        action: () => rename(context, item),
      ),
    ];
  }

  Widget shareIcon() {
    return const Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: const Icon(Icons.group, size: 24, color: Colors.black26),
    );
  }
}
