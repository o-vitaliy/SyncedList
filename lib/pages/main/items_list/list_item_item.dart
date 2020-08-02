import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

class ListItemItem extends StatelessWidget {
  final ShoppingItem item;
  final Function(ShoppingItem, bool) onItemChanged;

  const ListItemItem(this.item, this.onItemChanged, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final defaultTextStyle = t.textTheme.bodyText1;

    final color = item.done ? Colors.black45 : defaultTextStyle.color;
    final decoration =
        item.done ? TextDecoration.lineThrough : TextDecoration.none;

    return Card(
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.reorder),
          )
        ],
      ),
    );
  }
}
