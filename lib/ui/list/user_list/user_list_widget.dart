import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/ui/widgets/reorderable.dart';

import 'user_list_item_widget.dart';
import 'user_lists_view.dart';

class UserListsWidget extends StatelessWidget {
  final List<UserList> items;
  final ItemAction<UserList> share;
  final ItemAction<UserList> delete;
  final ItemAction<UserList> rename;
  final ReorderAction reorder;

  const UserListsWidget({
    super.key,
    required this.items,
    required this.share,
    required this.delete,
    required this.rename,
    required this.reorder,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
      buildDefaultDragHandles: false,
      proxyDecorator: liftedProxyDecorator,
      itemCount: items.length,
      onReorderItem: (oldPos, newPos) => reorder(items[oldPos], oldPos, newPos),
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          key: ValueKey(item.id),
          padding: const EdgeInsets.only(bottom: 8),
          child: ReorderableDelayedDragStartListener(
            index: index,
            child: UserListItemWidget(
              item: item,
              index: index,
              share: share,
              delete: delete,
              rename: rename,
            ),
          ),
        );
      },
    );
  }
}
