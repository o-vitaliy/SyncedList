import 'package:async_redux/async_redux.dart';

import 'new_item_state.dart';

class NewItemActionChangeLoading extends ReduxAction<NewItemState> {
  final bool value;

  NewItemActionChangeLoading({required this.value});

  @override
  NewItemState reduce() {
    return state.copyWith(loading: value);
  }
}
