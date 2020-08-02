import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/main.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/items_list/item_list_action_subscribe.dart';
import 'package:shared_shopping_list/pages/main/items_list/item_list_action_unsubscribe.dart';
import 'package:shared_shopping_list/pages/main/items_list/list_item_list.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_share.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'item_list_action_done.dart';
import 'item_list_action_reorder.dart';
import 'item_list_state.dart';
import 'list_item_empty.dart';
import 'new_item/new_item_form.dart';

class ListItemsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserList args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.name),
          actions: [_share(args)],
        ),
        floatingActionButton: _createListButton(context, args.id),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _ListItemsContentView(args),
        ));
  }

  Widget _createListButton(BuildContext context, String listId) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _createListDialog(context, listId),
    );
  }

  void _createListDialog(BuildContext context, String listId) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(content: NewItemForm(listId)));
  }

  Widget _share(UserList list) {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () => mainStore.dispatch(UserListActionShare(list)),
    );
  }
}

class _ListItemsContentView extends StatelessWidget {
  final Store store;

  factory _ListItemsContentView(UserList list) => _ListItemsContentView._(
      store: Store<ItemListState>(initialState: ItemListState.initial(list)));

  _ListItemsContentView._({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ItemListState>(
      store: store,
      child: _ListItemsConnector(),
    );
  }
}

class _ListItemsConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ItemListState, _ViewModel>(
      converter: _ViewModel.fromStore,
      onInit: (s) => s.dispatch(ItemListActionSubscribe()),
      onDispose: (s) => s.dispatch(ItemListActionUnsubscribe()),
      builder: _content,
    );
  }

  Widget _content(final BuildContext context, _ViewModel vm) {
    if (vm.loading) {
      return const LoadingIndicator();
    } else if (vm.items.isEmpty) {
      return const ListItemEmpty();
    } else {
      return ListItemList(vm.items, vm.done, vm.reorder);
    }
  }
}

@immutable
class _ViewModel {
  final bool loading;
  final List<ShoppingItem> items;
  final ReorderAction reorder;
  final Function(ShoppingItem item, bool done) done;

  _ViewModel({
    @required this.loading,
    @required this.items,
    @required this.done,
    @required this.reorder,
  });

  static _ViewModel fromStore(Store<ItemListState> store) {
    final loading = store.state.loading;
    final items = store.state.items;
    final done = (ShoppingItem item, bool done) =>
        store.dispatch(ItemListActionDone(item, done));
    final ReorderAction reorder =
        (item, o, n) => store.dispatch(ItemListActionReorder(o, n));
    return _ViewModel(
      loading: loading,
      items: items,
      done: done,
      reorder: reorder,
    );
  }
}
