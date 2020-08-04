import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';

import '../choice.dart';

const dragIcon = Icon(Icons.drag_handle, color: Colors.black26);

class ListItemItem extends StatelessWidget {
  final ShoppingItem item;
  final ItemAction<ShoppingItem> delete;
  final ItemAction<ShoppingItem> rename;
  final Function(ShoppingItem, bool) onItemChanged;

  const ListItemItem(
    this.item,
    this.delete,
    this.rename,
    this.onItemChanged, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final defaultTextStyle = t.textTheme.bodyText1;

    final color = item.done ? Colors.black45 : defaultTextStyle.color;
    final decoration =
        item.done ? TextDecoration.lineThrough : TextDecoration.none;

    return ReorderableListener(
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                controlAffinity: ListTileControlAffinity.leading,
                value: item.done,
                onChanged: (value) => onItemChanged(item, value),
                title: Text(
                  item.value,
                  style: defaultTextStyle.copyWith(
                    color: color,
                    decoration: decoration,
                  ),
                ),
              ),
            ),
            dragIcon,
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
    );
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

  List<Choice> getChoices(BuildContext context, ShoppingItem item) {
    final l = L.of(context);
    return [
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
}
