import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

@immutable
class NewItemState {
  final String listId;
  final String? name;
  final String? itemId;
  final int order;
  final bool loading;
  final Event<String> savedEvent;

  const NewItemState({
    required this.listId,
    required this.name,
    required this.itemId,
    required this.order,
    required this.loading,
    required this.savedEvent,
  });

  factory NewItemState.initial(
    String listId,
    String? name,
    String? itemId,
    int? order,
  ) {
    return NewItemState(
      listId: listId,
      name: name,
      itemId: itemId,
      order: order ?? DateTime.now().millisecondsSinceEpoch,
      loading: false,
      savedEvent: Event<String>.spent(),
    );
  }

  NewItemState copyWith({
    String? listId,
    String? name,
    String? itemId,
    int? order,
    bool? loading,
    Event<String>? savedEvent,
  }) {
    return NewItemState(
      listId: listId ?? this.listId,
      name: name ?? this.name,
      itemId: itemId ?? this.itemId,
      order: order ?? this.order,
      loading: loading ?? this.loading,
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
          itemId == other.itemId &&
          order == other.order &&
          loading == other.loading &&
          savedEvent == other.savedEvent;

  @override
  int get hashCode =>
      listId.hashCode ^
      name.hashCode ^
      itemId.hashCode ^
      order.hashCode ^
      loading.hashCode ^
      savedEvent.hashCode;
}
