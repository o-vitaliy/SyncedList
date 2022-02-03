import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:give_a_ride/data/entities/choice.dart';
import 'package:give_a_ride/data/entities/shopping_item.dart';

import '../../../localization.dart';
import 'user_lists_view.dart';

const dragIcon = Icon(Icons.drag_handle, color: Colors.black26);

class ListItemItem extends StatelessWidget {
  final ShoppingItem item;
  final ItemAction<ShoppingItem> delete;
  final ItemAction<ShoppingItem> rename;
  final Function(ShoppingItem, bool) onItemChanged;
  final bool reorderEnabled;

  const ListItemItem(
    this.item,
    this.delete,
    this.rename,
    this.onItemChanged,
    this.reorderEnabled, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final defaultTextStyle = t.textTheme.bodyText1;

    final color = item.done ? Colors.black45 : (defaultTextStyle?.color ?? Colors.black45);
    final decoration =
        item.done ? TextDecoration.lineThrough : TextDecoration.none;

    return ReorderableListener(
      canStart: () => reorderEnabled,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                contentPadding: const EdgeInsets.all(0),
                controlAffinity: ListTileControlAffinity.leading,
                value: item.done,
                onChanged: (value) => onItemChanged(item, value ?? false),
                title: Text(
                  item.value,
                  style: defaultTextStyle?.copyWith(
                    color: color,
                    decoration: decoration,
                  ),
                ),
              ),
            ),
            if (reorderEnabled) dragIcon,
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
    final l = Localizations.of(context, AppLocalizationsData);
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
