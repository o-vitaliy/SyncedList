import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/localization.dart';
import 'package:give_a_ride/state/app_state.dart';
import 'package:give_a_ride/ui/list/new_list/new_list_form.dart';
import 'package:give_a_ride/ui/widgets/dialogs.dart';
import 'package:give_a_ride/ui/widgets/widgets.dart';
import 'actions/new_list_action_delete.dart';
import 'actions/new_list_action_init.dart';
import 'actions/new_list_action_reorder.dart';
import 'actions/new_list_action_share.dart';
import 'actions/new_list_action_subscribe.dart';
import 'actions/new_list_action_unsubscribe.dart';
import 'user_list_empty_widget.dart';
import 'user_list_widget.dart';

typedef ItemAction<T> = Function(BuildContext context, T item);
typedef ReorderAction<T> = Function(T item, int oldPos, int newPos);

class UserListsView extends StatelessWidget {
  const UserListsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localizations.of(context, AppLocalizationsData).yourLists),
      ),
      floatingActionButton: _createListButton(context),
      body: StoreConnector<AppState, _ViewModel>(
          converter: _ViewModel.fromStore,
          onDidChange: (c, s, vm) => modelChanged(c, vm),
          onInit: (store) {
            store.dispatch(UserListActionInit());
            store.dispatch(UserListActionSubscribe());
          },
          onDispose: (store) {
            store.dispatch(UserListActionUnsubscribe());
          },
          builder: (BuildContext c, _ViewModel vm) => _content(c, vm)),
    );
  }

  Widget _content(BuildContext c, _ViewModel vm) {
    if (vm.loading) {
      return const LoadingIndicator();
    } else if (vm.items.isEmpty) {
      return const UserListEmptyWidget();
    } else {
      return _list(c, vm);
    }
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
      child: const Icon(Icons.add),
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
    final l = Localizations.of(context, AppLocalizationsData);
    confirmDialog(context, l.deleteListConfirm, () {
      vm.delete(item);
    });
  }

  void modelChanged(BuildContext context, _ViewModel vm) {
    final invite = vm.inviteEvent.consume();
    if (invite != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        final msg = Localizations.of(context, AppLocalizationsData)
            .invitedInToLists(name: invite.join(", "));
        defaultToast(msg);
      });
    }
  }

  void rename(BuildContext context, UserList? item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: NewListForm(item?.id, item?.name),
      ),
    );
  }
}

class _ViewModel extends Vm {
  final bool loading;
  final List<UserList> items;
  final Function(UserList) share;
  final Function(UserList) delete;
  final Function(int oldPosition, int newPosition) reorder;
  final Event<List<String>> inviteEvent;

  _ViewModel({
    required this.loading,
    required this.items,
    required this.share,
    required this.delete,
    required this.reorder,
    required this.inviteEvent,
  }) : super(equals: [loading, items, inviteEvent]);

  static _ViewModel fromStore(Store<AppState> store) {
    final loading = store.state.userListState?.loading ?? true;
    final items = store.state.userListState?.list ?? [];
    void share(UserList item) => store.dispatch(UserListActionShare(item));
    void delete(UserList item) => store.dispatch(UserListActionDelete(item));

    void reorder(int oldPosition, int newPosition) =>
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
