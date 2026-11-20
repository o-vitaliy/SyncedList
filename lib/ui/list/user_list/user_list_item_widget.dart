import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/ui/widgets/reorderable.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'user_lists_view.dart';

class UserListItemWidget extends StatelessWidget {
  final UserList item;
  final int index;
  final ItemAction<UserList> share;
  final ItemAction<UserList> delete;
  final ItemAction<UserList> rename;

  const UserListItemWidget({
    super.key,
    required this.item,
    required this.index,
    required this.share,
    required this.delete,
    required this.rename,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final initial = item.name.trim().isEmpty
        ? "?"
        : item.name.trim().characters.first.toUpperCase();

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
        onTap: () => Navigator.pushNamed(context, "/items", arguments: item),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: scheme.secondaryContainer,
          foregroundColor: scheme.onSecondaryContainer,
          child: Text(
            initial,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        title: Text(
          item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: item.shared
            ? Row(
                children: [
                  Icon(Icons.group_outlined, size: 16, color: scheme.primary),
                  const SizedBox(width: 4),
                  Text(l.sharedList, style: TextStyle(color: scheme.primary)),
                ],
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton<VoidCallback>(
              onSelected: (action) => action(),
              itemBuilder: (context) => [
                menuAction(
                  Icons.share_outlined,
                  l.share,
                  () => share(context, item),
                ),
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
            DragHandle(index: index),
          ],
        ),
      ),
    );
  }
}
