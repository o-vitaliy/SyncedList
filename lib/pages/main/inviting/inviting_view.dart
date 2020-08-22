import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/pages/main/new_list/new_list_action_add_from_invites.dart';
import 'package:shared_shopping_list/widgets/dialogs.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'invite_args.dart';

class InvitingView extends StatelessWidget {
  const InvitingView();

  @override
  Widget build(BuildContext context) {
    final InviteArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: StoreConnector<AppState, _ViewModel>(
          model: _ViewModel(),
          onInit: (store) => store.dispatch(NewListActionAddFromInvite()),
          builder: (c, vm) => _InvitingViewContent(vm: vm, name: args.name)),
    );
  }
}

class _InvitingViewContent extends StatefulWidget {
  final _ViewModel vm;
  final String name;

  const _InvitingViewContent({Key key, this.vm, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<_InvitingViewContent> {
  String get name => widget.name;

  _ViewModel get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Adding new list " + name),
          defaultSpacer(),
          LoadingIndicator(),
        ],
      )),
    );
  }

  @override
  void didUpdateWidget(_InvitingViewContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    final error = vm.error.consume();
    if (error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed("/main");
        defaultUserExceptionDialog(context, error);
      });
    }

    final invite = vm.inviteEvent.consume();
    if (invite != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final msg = L.of(context).invitedInToLists(name: invite.join(", "));
        Navigator.of(context).pushReplacementNamed("/main");
        defaultToast(msg);
      });
    }
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  Event<UserException> error;
  Event<List<String>> inviteEvent;

  _ViewModel.build({this.error, this.inviteEvent})
      : super(equals: [error, inviteEvent]);

  @override
  BaseModel fromStore() {
    return _ViewModel.build(
      error: Event(getAndRemoveFirstError()),
      inviteEvent: state.joinedToList,
    );
  }
}
