import 'package:async_redux/async_redux.dart';

import 'new_list_state.dart';

class NewListActionChangeName extends ReduxAction<NewListState> {
  final String value;

  NewListActionChangeName({this.value});

  @override
  NewListState reduce() {
    return state.copyWith(name: value);
  }
}
