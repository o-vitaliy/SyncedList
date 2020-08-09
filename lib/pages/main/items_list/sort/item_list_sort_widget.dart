import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/sort_action_auto.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/sort_action_one_time.dart';
import 'package:shared_shopping_list/widgets/tiles.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'item_sort.dart';

class ItemListSortWidget extends StatelessWidget {
  const ItemListSortWidget();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      model: _ViewModel(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, _ViewModel vm) {
    final l = L.of(context);
    return PopupMenuButton<ItemSort>(
      onSelected: (v) => vm.sortChanged(v),
      icon: Icon(Icons.sort),
      itemBuilder: (BuildContext context) {
        return []
          ..add(_title(context, l.sort.auto + ":"))
          ..addAll(ItemSortHelper.autoSorts()
              .map((e) => _sortCheckboxes(context, e, vm)))
          ..add(PopupMenuDivider())
          ..add(_title(context, l.sort.oneTime + ":"))
          ..addAll(ItemSortHelper.manualSorts().map((e) => _sorts(context, e)));
      },
    );
  }

  PopupMenuItem<ItemSort> _sorts(BuildContext context, ItemSort sort) {
    return PopupMenuItem<ItemSort>(
      value: sort,
      child: Row(
        children: [
          Icon(
            ItemSortHelper.getIcon(sort),
            color: Colors.black,
          ),
          defaultSpacer8(),
          Text(ItemSortHelper.getTitle(context, sort)),
        ],
      ),
    );
  }

  PopupMenuItem<ItemSort> _title(BuildContext context, String title) {
    return PopupMenuItem<ItemSort>(
      child: Text(title),
    );
  }

  PopupMenuItem<ItemSort> _sortCheckboxes(
      BuildContext context, ItemSort sort, _ViewModel vm) {
    return PopupMenuItem<ItemSort>(
      child: LabeledCheckbox(
        value: vm.selectedSorts.contains(sort),
        onChanged: (v) {
          vm.autoSortChanged(sort, v);
          Navigator.of(context).pop();
        },
        label: ItemSortHelper.getTitle(context, sort),
      ),
    );
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  List<ItemSort> selectedSorts;
  Function(ItemSort) sortChanged;
  Function(ItemSort, bool) autoSortChanged;

  _ViewModel.build({
    @required this.selectedSorts,
    @required this.sortChanged,
    @required this.autoSortChanged,
  }) : super(equals: [selectedSorts]);

  @override
  BaseModel fromStore() {
    return _ViewModel.build(
      selectedSorts: state.sorts,
      sortChanged: (sort) => dispatch(SortActionOneTime(sort)),
      autoSortChanged: (sort, enabled) =>
          dispatch(SortActionAuto(sort, enabled)),
    );
  }
}
