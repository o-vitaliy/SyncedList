import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/validators/validator.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/ui/widgets/dialogs.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'new_item_action_add.dart';
import 'new_item_action_change_name.dart';
import 'new_item_state.dart';

class NewItemForm extends StatelessWidget {
  final Store<NewItemState> store;
  final String? initialName;

  factory NewItemForm({
    required String listId,
    String? name,
    String? id,
    int? order,
  }) => NewItemForm._(
    store: Store<NewItemState>(
      initialState: NewItemState.initial(listId, name, id, order),
    ),
    initialName: name,
  );

  const NewItemForm._({required this.store, required this.initialName});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<NewItemState>(
      store: store,
      child: _FormConnector(initialName),
    );
  }
}

class _FormConnector extends StatelessWidget {
  final String? initialName;

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
  final String? initialName;

  const _FormContainer(this.vm, this.initialName);

  @override
  State createState() => _FormContainerState();
}

class _FormContainerState extends State<_FormContainer> {
  final _formKey = GlobalKey<FormState>();

  _ViewModel get vm => widget.vm;

  void _onSave() {
    if (_formKey.currentState?.validate() == true) vm.save();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(hintText: l.newItemName),
            onChanged: vm.nameChanged,
            onFieldSubmitted: (_) => _onSave(),
            initialValue: widget.initialName,
            validator: (v) => requiredValidation(context, v),
          ),
          defaultSpacer(),
          if (!vm.loading)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(l.cancel),
                  onPressed: () => Navigator.pop(context),
                ),
                defaultSpacer8(),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(88, 44),
                  ),
                  onPressed: _onSave,
                  child: Text(l.save),
                ),
              ],
            )
          else
            const LoadingIndicator(),
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

class _ViewModel extends Vm {
  final bool loading;
  final Function(String) nameChanged;
  final VoidCallback save;
  final Event<UserException> error;
  final Event<String> savedEvent;

  _ViewModel({
    required this.loading,
    required this.nameChanged,
    required this.save,
    required this.error,
    required this.savedEvent,
  }) : super(equals: [loading, error, savedEvent]);

  static _ViewModel fromStore(Store<NewItemState> store) {
    void nameChanged(String v) =>
        store.dispatch(NewItemActionChangeName(value: v));
    void save() => store.dispatch(NewItemActionAddList());
    return _ViewModel(
      loading: store.state.loading,
      nameChanged: nameChanged,
      save: save,
      savedEvent: store.state.savedEvent,
      error: Event(store.getAndRemoveFirstError()),
    );
  }
}
