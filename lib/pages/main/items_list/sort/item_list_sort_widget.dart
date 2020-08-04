import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/sort_action_change.dart';
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
    return PopupMenuButton<ItemSort>(
      onSelected: (v) => vm.sortChanged(v),
      icon: Icon(Icons.sort),
      itemBuilder: (BuildContext context) {
        return ItemSort.values.map((e) => _sortCheckbox(context, e)).toList();
      },
    );
  }

  PopupMenuItem<ItemSort> _sortCheckbox(BuildContext context, ItemSort sort) {
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
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  Function(ItemSort) sortChanged;

  _ViewModel.build({this.sortChanged}) : super(equals: []);

  @override
  BaseModel fromStore() =>
      _ViewModel.build(sortChanged: (sort) => dispatch(SortActionChange(sort)));
}
