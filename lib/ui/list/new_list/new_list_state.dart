import 'package:async_redux/async_redux.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:meta/meta.dart';

@immutable
class NewListState {
  final String? id;
  final String name;
  final bool loading;
  final Event<UserList> savedEvent;
  final Event<String> editedEvent;
  final Event<String> error;

  factory NewListState.initial(String? id, String name) {
    return NewListState(
      id: id,
      name: name,
      loading: false,
      savedEvent: Event<UserList>.spent(),
      editedEvent: Event<String>.spent(),
      error: Event<String>.spent(),
    );
  }

//<editor-fold desc="Data Methods">

  const NewListState({
    required this.id,
    required this.name,
    required this.loading,
    required this.savedEvent,
    required this.editedEvent,
    required this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewListState &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          loading == other.loading &&
          savedEvent == other.savedEvent &&
          editedEvent == other.editedEvent &&
          error == other.error);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      loading.hashCode ^
      savedEvent.hashCode ^
      editedEvent.hashCode ^
      error.hashCode;

  @override
  String toString() {
    return 'NewListState{' +
        ' id: $id,' +
        ' name: $name,' +
        ' loading: $loading,' +
        ' savedEvent: $savedEvent,' +
        ' editedEvent: $editedEvent,' +
        ' error: $error,' +
        '}';
  }

  NewListState copyWith({
    String? id,
    String? name,
    bool? loading,
    Event<UserList>? savedEvent,
    Event<String>? editedEvent,
    Event<String>? error,
  }) {
    return NewListState(
      id: id ?? this.id,
      name: name ?? this.name,
      loading: loading ?? this.loading,
      savedEvent: savedEvent ?? this.savedEvent,
      editedEvent: editedEvent ?? this.editedEvent,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'loading': this.loading,
      'savedEvent': this.savedEvent,
      'editedEvent': this.editedEvent,
      'error': this.error,
    };
  }

  factory NewListState.fromMap(Map<String, dynamic> map) {
    return NewListState(
      id: map['id'] as String,
      name: map['name'] as String,
      loading: map['loading'] as bool,
      savedEvent: map['savedEvent'] as Event<UserList>,
      editedEvent: map['editedEvent'] as Event<String>,
      error: map['error'] as Event<String>,
    );
  }

//</editor-fold>
}
