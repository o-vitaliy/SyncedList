import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_init.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_share.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_subscribe.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_unsubscribe.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_list_widget.dart';
import 'package:shared_shopping_list/widgets/dialogs.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import '../new_list/new_list_form.dart';
import 'actions/new_list_action_delete.dart';
import 'actions/new_list_action_reorder.dart';
import 'user_list_empty_widget.dart';

typedef ItemAction<T> = Function(BuildContext context, T item);
typedef ReorderAction<T> = Function(T item, int oldPos, int newPos);

const _key = Key("UserListsView");

class UserListsView extends StatefulWidget {
  const UserListsView() : super(key: _key);

  @override
  State createState() => _State();
}

class _State extends State<UserListsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.of(context).yourLists),
      ),
      floatingActionButton: _createListButton(context),
      body: const _UserListConnector(),
    );
  }

  Widget _createListButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _createListDialog(context),
    );
  }

  void _createListDialog(BuildContext context) {
    rename(context, null);
  }
}

class _UserListConnector extends StatelessWidget {
  const _UserListConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        onInit: (store) {
          store.dispatch(UserListActionInit());
          store.dispatch(UserListActionSubscribe(this));
        },
        onDispose: (store) {
          store.dispatch(UserListActionUnsubscribe(this));
        },
        builder: (BuildContext c, _ViewModel vm) => _content(c, vm));
  }

  Widget _content(BuildContext c, _ViewModel vm) {
    if (vm.loading)
      return const LoadingIndicator();
    else if (vm.items.isEmpty)
      return const UserListEmptyWidget();
    else
      return _list(c, vm);
  }

  Widget _list(BuildContext c, _ViewModel vm) {
    return UserListsWidget(
      items: vm.items,
      delete: (c, i) => delete(c, i, vm),
      share: (c, i) => share(c, i, vm),
      rename: rename,
      reorder: (i, o, n) => vm.reorder(o, n),
    );
  }

  void share(BuildContext context, UserList item, _ViewModel vm) {
    vm.share(item);
  }

  void delete(BuildContext context, UserList item, _ViewModel vm) {
    final l = L.of(context);
    confirmDialog(context, l.deleteListConfirm, () {
      vm.delete(item);
    });
  }
}

void rename(BuildContext context, UserList item) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: NewListForm(item?.id, item?.name),
    ),
  );
}

@immutable
class _ViewModel {
  final bool loading;
  final List<UserList> items;
  final Function(UserList) share;
  final Function(UserList) delete;
  final Function(int oldPosition, int newPosition) reorder;

  _ViewModel({
    @required this.loading,
    @required this.items,
    @required this.share,
    @required this.delete,
    @required this.reorder,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    final loading = store.state.userListState.loading;
    final items = store.state.userListState.list;
    final share = (UserList item) => store.dispatch(UserListActionShare(item));
    final delete =
        (UserList item) => store.dispatch(UserListActionDelete(item));

    final reorder = (int oldPosition, int newPosition) =>
        store.dispatch(UserListActionReorder(oldPosition, newPosition));
    return _ViewModel(
      loading: loading,
      items: items,
      share: share,
      delete: delete,
      reorder: reorder,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          items == other.items;

  @override
  int get hashCode => loading.hashCode ^ items.hashCode;
}
