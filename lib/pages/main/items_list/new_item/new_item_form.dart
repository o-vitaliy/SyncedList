import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/data/validators/validator.dart';
import 'package:shared_shopping_list/localizations.dart';
import 'package:shared_shopping_list/pages/main/items_list/new_item/new_item_action_add.dart';
import 'package:shared_shopping_list/pages/main/items_list/new_item/new_item_action_change_name.dart';
import 'package:shared_shopping_list/widgets/dialogs.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'new_item_state.dart';

class NewItemForm extends StatelessWidget {
  final Store store;
  final String initialName;

  factory NewItemForm({
    String listId,
    String name,
    String id,
    int order,
  }) =>
      NewItemForm._(
          store: Store<NewItemState>(
            initialState: NewItemState.initial(
              listId,
              name,
              id,
              order,
            ),
          ),
          initialName: name);

  const NewItemForm._({Key key, this.store, this.initialName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<NewItemState>(
      store: store,
      child: _FormConnector(initialName),
    );
  }
}

class _FormConnector extends StatelessWidget {
  final String initialName;

  const _FormConnector(this.initialName);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<NewItemState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (c, vm) => _FormContainer(vm, initialName),
    );
  }
}

class _FormContainer extends StatefulWidget {
  final _ViewModel vm;
  final String initialName;

  const _FormContainer(this.vm, this.initialName, {Key key}) : super(key: key);

  @override
  State createState() => _FormContainerState();
}

class _FormContainerState extends State<_FormContainer> {
  _ViewModel get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final t = Theme.of(context);
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: l.newItemName),
            onChanged: vm.nameChanged,
            initialValue: widget.initialName,
            validator: (v) => requiredValidation(context, v),
          ),
          defaultSpacer(),
          if (!vm.loading)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  child: Text(l.cancel),
                  onPressed: () => Navigator.pop(context),
                ),
                defaultSpacer(),
                RaisedButton(
                  child: Text(l.save),
                  color: t.primaryColor,
                  textColor: Colors.white,
                  onPressed: vm.save,
                ),
              ],
            )
          else
            const LoadingIndicator()
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(_FormContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    final error = vm.error.consume();
    if (error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        defaultUserExceptionDialog(context, error);
      });
    }

    final saved = vm.savedEvent.consume();
    if (saved != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }
  }
}

class _ViewModel {
  final bool loading;
  final Function(String) nameChanged;
  final Function save;
  final Event<UserException> error;
  final Event<String> savedEvent;

  _ViewModel({
    @required this.loading,
    @required this.nameChanged,
    @required this.save,
    @required this.error,
    @required this.savedEvent,
  });

  static _ViewModel fromStore(Store<NewItemState> store) {
    final nameChanged =
        (String v) => store.dispatch(NewItemActionChangeName(value: v));
    final save = () => store.dispatch(NewItemActionAddList());
    return _ViewModel(
        loading: store.state.loading,
        nameChanged: nameChanged,
        save: save,
        savedEvent: store.state.savedEvent,
        error: Event(store.getAndRemoveFirstError()));
  }
}
