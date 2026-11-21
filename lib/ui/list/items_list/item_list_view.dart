import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/shopping_item.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/main.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/list/user_list/actions/new_list_action_share.dart';
import 'package:shopping_list/ui/list/user_list/user_lists_view.dart';
import 'package:shopping_list/ui/widgets/dialogs.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'actions/item_list_action_delete.dart';
import 'actions/item_list_action_done.dart';
import 'actions/item_list_action_reorder.dart';
import 'actions/item_list_action_subscribe.dart';
import 'actions/item_list_action_unsubscribe.dart';
import 'list_item_empty.dart';
import 'list_item_list.dart';
import 'new_item/new_item_form.dart';
import 'sort/item_list_sort_widget.dart';

class ListItemsView extends StatelessWidget {
  const ListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserList args =
        ModalRoute.of(context)!.settings.arguments! as UserList;
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name, overflow: TextOverflow.ellipsis),
        actions: [
          const ItemListSortWidget(),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: l.share,
            onPressed: () => mainStore.dispatch(UserListActionShare(args)),
          ),
          const SizedBox(width: 4),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text(l.addItem),
        onPressed: () => rename(context, args.id, null),
      ),
      body: _ListItemsConnector(args: args),
    );
  }
}

class _ListItemsConnector extends StatelessWidget {
  final UserList args;

  const _ListItemsConnector({required this.args});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      onInit: (s) => s.dispatch(ItemListActionSubscribe(args)),
      onDispose: (s) {
        s.dispatch(ItemListActionUnsubscribe(args));
      },
      builder: _content,
    );
  }

  Widget _content(BuildContext context, _ViewModel vm) {
    if (vm.loading) {
      return const LoadingIndicator();
    } else if (vm.items.isEmpty) {
      return const ListItemEmpty();
    } else {
      return Column(
        children: [
          _ProgressHeader(done: vm.doneCount, total: vm.items.length),
          Expanded(
            child: ListItemList(
              items: vm.items,
              delete: (c, i) => delete(c, i, vm),
              rename: (c, i) => rename(c, vm.listId, i),
              onItemChanged: vm.done,
              reorder: vm.reorder,
              reorderEnabled: vm.reorderEnabled,
            ),
          ),
        ],
      );
    }
  }

  void delete(BuildContext context, ShoppingItem item, _ViewModel vm) {
    final l = AppLocalizations.of(context);
    confirmDialog(context, l.deleteItemConfirm, () {
      vm.delete(item);
    });
  }
}

/// "3 of 7 done" with a progress bar above the items.
class _ProgressHeader extends StatelessWidget {
  final int done;
  final int total;

  const _ProgressHeader({required this.done, required this.total});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final complete = done == total;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                complete ? Icons.check_circle : Icons.shopping_basket_outlined,
                size: 18,
                color: complete ? scheme.primary : scheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context).itemsProgress(done, total),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            tween: Tween(end: total == 0 ? 0 : done / total),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            builder: (context, value, _) =>
                LinearProgressIndicator(value: value),
          ),
        ],
      ),
    );
  }
}

void rename(BuildContext context, String listId, ShoppingItem? item) {
  final l = AppLocalizations.of(context);
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(item == null ? l.addItem : l.editItem),
      content: NewItemForm(
        listId: listId,
        name: item?.value,
        id: item?.id,
        order: item?.order,
      ),
    ),
  );
}

@immutable
class _ViewModel extends Vm {
  final bool loading;
  final String listId;
  final List<ShoppingItem> items;
  final int doneCount;
  final Function(ShoppingItem) delete;
  final ReorderAction reorder;
  final bool reorderEnabled;
  final Function(ShoppingItem item, bool done) done;

  _ViewModel({
    required this.loading,
    required this.listId,
    required this.items,
    required this.doneCount,
    required this.done,
    required this.delete,
    required this.reorder,
    required this.reorderEnabled,
  }) : super(equals: [loading, listId, items, doneCount, reorderEnabled]);

  static _ViewModel fromStore(Store<AppState> store) {
    final state = store.state.itemListState!;
    final loading = state.loading;
    final listId = state.list.id;
    final items = state.items;
    final doneCount = items.where((e) => e.done).length;
    void done(ShoppingItem item, bool done) =>
        store.dispatch(ItemListActionDone(item, done));
    void reorder(item, o, n) => store.dispatch(ItemListActionReorder(o, n));
    void delete(ShoppingItem item) =>
        store.dispatch(ItemListActionDelete(item));

    final reorderEnabled = store.state.sorts?.isEmpty ?? false;
    return _ViewModel(
      loading: loading,
      listId: listId,
      items: items,
      doneCount: doneCount,
      done: done,
      delete: delete,
      reorder: reorder,
      reorderEnabled: reorderEnabled,
    );
  }
}
