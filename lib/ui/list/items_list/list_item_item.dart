import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/shopping_item.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/ui/list/user_list/user_lists_view.dart';
import 'package:shopping_list/ui/widgets/reorderable.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

class ListItemItem extends StatelessWidget {
  final ShoppingItem item;
  final int index;
  final ItemAction<ShoppingItem> delete;
  final ItemAction<ShoppingItem> rename;
  final Function(ShoppingItem, bool) onItemChanged;
  final bool reorderEnabled;

  const ListItemItem(
    this.item,
    this.index,
    this.delete,
    this.rename,
    this.onItemChanged,
    this.reorderEnabled, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final done = item.done;

    return Card(
      // Bought items recede: flatter background, muted struck-through text.
      color: done ? Colors.transparent : scheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: done ? BorderSide(color: scheme.outlineVariant) : BorderSide.none,
      ),
      child: InkWell(
        onTap: () => onItemChanged(item, !done),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Row(
            children: [
              Checkbox(
                value: done,
                onChanged: (value) => onItemChanged(item, value ?? false),
              ),
              Expanded(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: done ? scheme.onSurfaceVariant : scheme.onSurface,
                    decoration: done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: scheme.onSurfaceVariant,
                  ),
                  child: Text(item.value),
                ),
              ),
              PopupMenuButton<VoidCallback>(
                onSelected: (action) => action(),
                itemBuilder: (context) => [
                  menuAction(
                    Icons.edit_outlined,
                    l.rename,
                    () => rename(context, item),
                  ),
                  menuAction(
                    Icons.delete_outline,
                    l.delete,
                    () => delete(context, item),
                    color: scheme.error,
                  ),
                ],
              ),
              if (reorderEnabled) DragHandle(index: index),
            ],
          ),
        ),
      ),
    );
  }
}
