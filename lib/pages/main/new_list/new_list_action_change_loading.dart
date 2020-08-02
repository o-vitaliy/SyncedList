import 'package:async_redux/async_redux.dart';

import 'new_list_state.dart';

class NewListActionChangeLoading extends ReduxAction<NewListState> {
  final bool value;

  NewListActionChangeLoading({this.value});

  @override
  NewListState reduce() {
    return state.copyWith(loading: value);
  }
}
