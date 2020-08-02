import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/data/validators/validator.dart';
import 'package:shared_shopping_list/models/user_list.dart';
import 'package:shared_shopping_list/pages/main/new_list/new_list_action_change_name.dart';
import 'package:shared_shopping_list/pages/main/new_list/new_list_action_save_list.dart';
import 'package:shared_shopping_list/widgets/dialogs.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import '../../../localizations.dart';
import 'new_list_state.dart';

final _formKey = GlobalKey<FormState>();

class NewListForm extends StatefulWidget {
  final Store store;
  final String initialName;

  factory NewListForm(String id, String name) => NewListForm._(
        store:
            Store<NewListState>(initialState: NewListState.initial(id, name)),
        initialName: name,
      );

  const NewListForm._({Key key, this.store, this.initialName})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewListFormState();
}

class _NewListFormState extends State<NewListForm> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<NewListState>(
      store: widget.store,
      child: _FormConnector(widget.initialName),
    );
  }
}

class _FormConnector extends StatelessWidget {
  final String initialName;

  const _FormConnector(this.initialName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<NewListState, _ViewModel>(
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
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: widget.initialName,
            decoration: InputDecoration(hintText: l.newListName),
            onChanged: vm.nameChanged,
            validator: (v) => requiredValidation(context, v),
          ),
          defaultSpacer(),
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
                onPressed: save,
              ),
            ],
          )
        ],
      ),
    );
  }

  void save() {
    if (!_formKey.currentState.validate()) return;
    vm.save();
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

    final saved = vm.saved.consume();
    if (saved != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
        Navigator.pushNamed(context, "/items", arguments: saved);
      });
    }

    final edited = vm.edited.consume();
    if (edited != null) {
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
  final Event<UserList> saved;
  final Event<String> edited;

  _ViewModel({
    @required this.loading,
    @required this.nameChanged,
    @required this.save,
    @required this.saved,
    @required this.edited,
    @required this.error,
  });

  static _ViewModel fromStore(Store<NewListState> store) {
    final nameChanged =
        (String v) => store.dispatch(NewListActionChangeName(value: v));
    final save = () => store.dispatch(NewListActionSaveList());
    return _ViewModel(
        loading: store.state.loading,
        nameChanged: nameChanged,
        save: save,
        saved: store.state.savedEvent,
        edited: store.state.editedEvent,
        error: Event(store.getAndRemoveFirstError()));
  }
}
