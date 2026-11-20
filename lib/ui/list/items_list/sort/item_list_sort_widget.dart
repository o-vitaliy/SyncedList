import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';
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
    return PopupMenuButton<VoidCallback>(
      icon: const Icon(Icons.sort),
      tooltip: l.sortMenu,
      onSelected: (action) => action(),
      itemBuilder: (BuildContext context) {
        return [
          _header(context, l.sortAuto),
          for (final sort in ItemSortHelper.autoSorts())
            _autoSort(context, sort, vm),
          const PopupMenuDivider(),
          _header(context, l.sortOneTime),
          for (final sort in ItemSortHelper.manualSorts())
            menuAction(
              ItemSortHelper.getIcon(sort),
              ItemSortHelper.getTitle(context, sort),
              () => vm.sortChanged(sort),
            ),
        ];
      },
    );
  }

  PopupMenuEntry<VoidCallback> _header(BuildContext context, String title) {
    final theme = Theme.of(context);
    return PopupMenuItem<VoidCallback>(
      enabled: false,
      height: 36,
      child: Text(
        title,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  PopupMenuEntry<VoidCallback> _autoSort(
    BuildContext context,
    ItemSort sort,
    _ViewModel vm,
  ) {
    final checked = vm.selectedSorts?.contains(sort) ?? false;
    return CheckedPopupMenuItem<VoidCallback>(
      value: () => vm.autoSortChanged(sort, !checked),
      checked: checked,
      child: Text(ItemSortHelper.getTitle(context, sort)),
    );
  }
}

@immutable
class _ViewModel extends Vm {
  final List<ItemSort>? selectedSorts;
  final Function(ItemSort) sortChanged;
  final Function(ItemSort, bool) autoSortChanged;

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
