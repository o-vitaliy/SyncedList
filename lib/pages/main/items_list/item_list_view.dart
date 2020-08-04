import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/main.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/items_list/item_list_action_delete.dart';
import 'package:shared_shopping_list/pages/main/items_list/item_list_action_subscribe.dart';
import 'package:shared_shopping_list/pages/main/items_list/item_list_action_unsubscribe.dart';
import 'package:shared_shopping_list/pages/main/items_list/list_item_list.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/item_list_sort_widget.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_share.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';
import 'package:shared_shopping_list/widgets/dialogs.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'item_list_action_done.dart';
import 'item_list_action_reorder.dart';
import 'list_item_empty.dart';
import 'new_item/new_item_form.dart';

class ListItemsView extends StatelessWidget {
  const ListItemsView();

  @override
  Widget build(BuildContext context) {
    final UserList args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.name),
          actions: [ItemListSortWidget(), _share(args)],
        ),
        floatingActionButton: _createListButton(context, args.id),
        body: _ListItemsConnector(args: args));
  }

  Widget _createListButton(BuildContext context, String listId) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _createItemDialog(context, listId),
    );
  }

  void _createItemDialog(BuildContext context, String listId) {
    rename(context, listId, null);
  }

  Widget _share(UserList list) {
    return IconButton(
      icon: Icon(Icons.share),
      tooltip: "Share",
      onPressed: () => mainStore.dispatch(UserListActionShare(list)),
    );
  }
}

class _ListItemsConnector extends StatelessWidget {
  final UserList args;

  const _ListItemsConnector({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      onInit: (s) => s.dispatch(ItemListActionSubscribe(args)),
      onDispose: (s) {
        s.dispatch(ItemListActionUnsubscribe());
      },
      builder: _content,
    );
  }

  Widget _content(final BuildContext context, _ViewModel vm) {
    if (vm.loading) {
      return const LoadingIndicator();
    } else if (vm.items.isEmpty) {
      return const ListItemEmpty();
    } else {
      return Column(
        children: [
          if (vm.items.length > 1) progress(vm.doneCount, vm.items.length),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListItemList(
                items: vm.items,
                delete: (c, i) => delete(c, i, vm),
                rename: (c, i) => rename(c, vm.listId, i),
                onItemChanged: vm.done,
                reorder: vm.reorder,
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget progress(int done, int total) {
    return LinearProgressIndicator(
      value: done.toDouble() / total.toDouble(),
    );
  }

  void delete(BuildContext context, ShoppingItem item, _ViewModel vm) {
    final l = L.of(context);
    confirmDialog(context, l.deleteItemConfirm, () {
      vm.delete(item);
    });
  }
}

void rename(BuildContext context, String listId, ShoppingItem item) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
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
class _ViewModel {
  final bool loading;
  final String listId;
  final List<ShoppingItem> items;
  final int doneCount;
  final Function(ShoppingItem) delete;
  final ReorderAction reorder;
  final Function(ShoppingItem item, bool done) done;

  _ViewModel({
    @required this.loading,
    @required this.listId,
    @required this.items,
    @required this.doneCount,
    @required this.done,
    @required this.delete,
    @required this.reorder,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    final state = store.state.itemListState;
    final loading = state.loading;
    final listId = state.list.id;
    final items = state.items;
    final doneCount = items.where((e) => e.done).length;
    final done = (ShoppingItem item, bool done) =>
        store.dispatch(ItemListActionDone(item, done));
    final ReorderAction reorder =
        (item, o, n) => store.dispatch(ItemListActionReorder(o, n));
    final Function delete =
        (ShoppingItem item) => store.dispatch(ItemListActionDelete(item));
    return _ViewModel(
      loading: loading,
      listId: listId,
      items: items,
      doneCount: doneCount,
      done: done,
      delete: delete,
      reorder: reorder,
    );
  }
}
