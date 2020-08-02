import 'package:flutter/material.dart';
import 'package:shared_shopping_list/localizations.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';

import '../choice.dart';

class UserListItemWidget extends StatelessWidget {
  final UserList item;

  final ItemAction share;
  final ItemAction delete;
  final ItemAction rename;

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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Icon(Icons.group, size: 18),
    );
  }
}
