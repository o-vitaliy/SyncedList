import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/data/validators/validator.dart';
import 'package:give_a_ride/ui/widgets/dialogs.dart';
import 'package:give_a_ride/ui/widgets/widgets.dart';

import '../../../localization.dart';
import 'actions/new_list_action_change_name.dart';
import 'actions/new_list_action_save_list.dart';
import 'new_list_state.dart';

final _formKey = GlobalKey<FormState>();

class NewListForm extends StatefulWidget {
  final Store<NewListState> store;
  final String? initialName;

  factory NewListForm(String? id, String? name) => NewListForm._(
        store: Store<NewListState>(
          initialState: NewListState.initial(id, name ?? ""),
        ),
        initialName: name,
      );

  const NewListForm._({
    Key? key,
    required this.store,
    required this.initialName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewListFormState();
}

class _NewListFormState extends State<NewListForm> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<NewListState>(
        store: widget.store,
        child: StoreConnector<NewListState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (BuildContext context, _ViewModel vm) => _FormContainer(
                  initialName: widget.store.state.name,
                  loading: vm.loading,
                  nameChanged: vm.nameChanged,
                  save: vm.save,
                  error: vm.error,
                  saved: vm.saved,
                  edited: vm.edited,
                )));
  }
}

class _FormContainer extends StatefulWidget {
  final String initialName;
  final bool loading;
  final Function(String) nameChanged;
  final Function save;
  final Event<UserException> error;
  final Event<UserList> saved;
  final Event<String> edited;

  const _FormContainer({
    Key? key,
    required this.initialName,
    required this.loading,
    required this.nameChanged,
    required this.save,
    required this.error,
    required this.saved,
    required this.edited,
  }) : super(key: key);

  @override
  State createState() => _FormContainerState();
}

class _FormContainerState extends State<_FormContainer> {
  String get initialName => widget.initialName;

  bool get loading => widget.loading;

  Function(String) get nameChanged => widget.nameChanged;

  Function get save => widget.save;

  Event<UserException> get error => widget.error;

  Event<UserList> get saved => widget.saved;

  Event<String> get edited => widget.edited;

  @override
  Widget build(BuildContext context) {
    final l = Localizations.of(context, AppLocalizationsData);
    final t = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: initialName,
            decoration: InputDecoration(hintText: l.newListName),
            onChanged: nameChanged,
            validator: (v) => requiredValidation(context, v),
          ),
          defaultSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(l.cancel),
                onPressed: () => Navigator.pop(context),
              ),
              defaultSpacer(),
              ElevatedButton(
                child: Text(l.save),
                onPressed: onSave,
              ),
            ],
          )
        ],
      ),
    );
  }

  void onSave() {
    if (_formKey.currentState?.validate() == true) save();
  }

  @override
  void didUpdateWidget(_FormContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    final errorMessage = error.consume();
    if (errorMessage != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        defaultUserExceptionDialog(context, errorMessage);
      });
    }

    final savedValue = saved.consume();
    if (savedValue != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pop(context);
        Navigator.pushNamed(context, "/items", arguments: savedValue);
      });
    }

    if (edited.consume() != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }
  }
}

class _ViewModel extends Vm {
  final bool loading;
  final Function(String) nameChanged;
  final Function save;
  final Event<UserException> error;
  final Event<UserList> saved;
  final Event<String> edited;

  _ViewModel({
    required this.loading,
    required this.nameChanged,
    required this.save,
    required this.saved,
    required this.edited,
    required this.error,
  }) : super(equals: [loading, error, saved, edited]);

  static _ViewModel fromStore(Store<NewListState> store) {
    void nameChanged(String v) => store.dispatch(NewListActionChangeName(value: v));
    void save() => store.dispatch(NewListActionSaveList());

    final state = store.state;
    return _ViewModel(
        loading: state.loading,
        nameChanged: nameChanged,
        save: save,
        saved: state.savedEvent,
        edited: state.editedEvent,
        error: Event(store.getAndRemoveFirstError()));
  }
}
