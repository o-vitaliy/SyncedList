import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';
import 'package:shared_shopping_list/models/user_list.dart';

@immutable
class NewListState {
  final String id;
  final String name;
  final bool loading;
  final Event<UserList> savedEvent;
  final Event<String> editedEvent;
  final Event<String> error;

  NewListState({
    @required this.id,
    @required this.name,
    @required this.loading,
    @required this.savedEvent,
    @required this.editedEvent,
    @required this.error,
  });

  factory NewListState.initial(String id, String name) {
    return NewListState(
      id: id,
      name: name,
      loading: false,
      savedEvent: Event<UserList>.spent(),
      editedEvent: Event<String>.spent(),
      error: Event<String>.spent(),
    );
  }

  NewListState copyWith({
    String id,
    String name,
    bool loading,
    Event<UserList> savedEvent,
    Event<String> editedEvent,
    Event<String> error,
  }) {
    return new NewListState(
      id: id ?? this.id,
      name: name ?? this.name,
      loading: loading != null ? loading : this.loading,
      savedEvent: savedEvent ?? this.savedEvent,
      editedEvent: editedEvent ?? this.editedEvent,
      error: error ?? this.error,
    );
  }
}
