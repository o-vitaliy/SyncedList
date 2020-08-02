import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/localizations.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_init.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_share.dart';
import 'package:shared_shopping_list/pages/main/user_list/actions/new_list_action_update_list.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_list_widget.dart';
import 'package:shared_shopping_list/widgets/dialogs.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import '../new_list/new_list_form.dart';
import 'actions/new_list_action_delete.dart';
import 'actions/new_list_action_reorder.dart';
import 'user_list_empty_widget.dart';

typedef ItemAction = Function(BuildContext context, UserList item);
typedef ReorderAction<T> = Function(T item, int oldPos, int newPos);

class UserListsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.of(context).yourLists),
      ),
      floatingActionButton: _createListButton(context),
      body: StoreConnector<AppState, _ViewModel>(
          converter: _ViewModel.fromStore,
          onDidChange: (vm) => modelChanged(context, vm),
          onInit: (store) {
            store.dispatch(UserListActionInit());
            store.dispatch(UserListActionUpdateList());
          },
          builder: (BuildContext c, _ViewModel vm) => _content(c, vm)),
    );
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

  Widget _createListButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _createListDialog(context),
    );
  }

  void _createListDialog(BuildContext context) {
    rename(context, null);
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

  void modelChanged(BuildContext context, _ViewModel vm) {
    final invite = vm.inviteEvent.consume();
    if (invite != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final msg = L.of(context).invitedInToLists(invite.join(", "));
        defaultToast(msg);
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
}

@immutable
class _ViewModel {
  final bool loading;
  final List<UserList> items;
  final Function(UserList) share;
  final Function(UserList) delete;
  final Function(int oldPosition, int newPosition) reorder;
  final Event<List<String>> inviteEvent;

  _ViewModel({
    @required this.loading,
    @required this.items,
    @required this.share,
    @required this.delete,
    @required this.reorder,
    @required this.inviteEvent,
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
      inviteEvent: store.state.joinedToList,
    );
  }
}
