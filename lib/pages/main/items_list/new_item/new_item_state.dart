import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

@immutable
class NewItemState {
  final String listId;
  final String name;
  final bool loading;
  final Event<ShoppingItem> savedEvent;

  NewItemState({
    @required this.listId,
    @required this.name,
    @required this.loading,
    @required this.savedEvent,
  });

  factory NewItemState.initial(String listId) {
    return NewItemState(
      listId: listId,
      name: null,
      loading: false,
      savedEvent: Event<ShoppingItem>.spent(),
    );
  }

  NewItemState copyWith({
    String listId,
    String name,
    bool loading,
    Event<ShoppingItem> savedEvent,
  }) {
    return new NewItemState(
      listId: listId ?? this.listId,
      name: name ?? this.name,
      loading: loading != null ? loading : this.loading,
      savedEvent: savedEvent ?? this.savedEvent,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewItemState &&
          runtimeType == other.runtimeType &&
          listId == other.listId &&
          name == other.name &&
          loading == other.loading &&
          savedEvent == other.savedEvent;

  @override
  int get hashCode =>
      listId.hashCode ^ name.hashCode ^ loading.hashCode ^ savedEvent.hashCode;
}
