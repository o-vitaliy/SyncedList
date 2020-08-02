import 'package:async_redux/async_redux.dart';

import 'new_item_state.dart';

class NewItemActionChangeName extends ReduxAction<NewItemState> {
  final String value;

  NewItemActionChangeName({this.value});

  @override
  NewItemState reduce() {
    return state.copyWith(name: value);
  }
}
