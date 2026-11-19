import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/widgets/tiles.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'sort_action_auto.dart';
import 'sort_action_one_time.dart';

class ItemListSortWidget extends StatelessWidget {
  const ItemListSortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: _content,
    );
  }

  Widget _content(BuildContext context, _ViewModel vm) {
    final l = AppLocalizations.of(context);
    return PopupMenuButton<ItemSort>(
      onSelected: (v) => vm.sortChanged(v),
      icon: const Icon(Icons.sort),
      itemBuilder: (BuildContext context) {
        return [_title(context, "${l.sortAuto}:"), ...ItemSortHelper.autoSorts().map(
              (e) => _sortCheckboxes(context, e, vm),
            ), const PopupMenuDivider(), _title(context, "${l.sortOneTime}:")]
          
          
          
          
          ..addAll(ItemSortHelper.manualSorts().map((e) => _sorts(context, e)));
      },
    );
  }

  PopupMenuItem<ItemSort> _sorts(BuildContext context, ItemSort sort) {
    return PopupMenuItem<ItemSort>(
      value: sort,
      child: Row(
        children: [
          Icon(ItemSortHelper.getIcon(sort), color: Colors.black),
          defaultSpacer8(),
          Text(ItemSortHelper.getTitle(context, sort)),
        ],
      ),
    );
  }

  PopupMenuItem<ItemSort> _title(BuildContext context, String title) {
    return PopupMenuItem<ItemSort>(child: Text(title));
  }

  PopupMenuItem<ItemSort> _sortCheckboxes(
    BuildContext context,
    ItemSort sort,
    _ViewModel vm,
  ) {
    return PopupMenuItem<ItemSort>(
      child: LabeledCheckbox(
        value: vm.selectedSorts?.contains(sort) ?? false,
        onChanged: (v) {
          vm.autoSortChanged(sort, v);
          Navigator.of(context).pop();
        },
        label: ItemSortHelper.getTitle(context, sort),
      ),
    );
  }
}

@immutable
class _ViewModel extends Vm {
  List<ItemSort>? selectedSorts;
  Function(ItemSort) sortChanged;
  Function(ItemSort, bool) autoSortChanged;

  _ViewModel({
    required this.selectedSorts,
    required this.sortChanged,
    required this.autoSortChanged,
  }) : super(equals: [selectedSorts]);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedSorts: store.state.sorts,
      sortChanged: (sort) => store.dispatch(SortActionOneTime(sort)),
      autoSortChanged: (sort, enabled) =>
          store.dispatch(SortActionAuto(sort, enabled)),
    );
  }
}
