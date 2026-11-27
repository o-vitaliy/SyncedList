import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';
import 'package:shopping_list/data/repos/suggestions_repo.dart';

@immutable
class NewItemState {
  final String listId;
  final String? name;
  final String? itemId;
  final int order;
  final bool loading;
  final Event<String> savedEvent;

  /// Names to suggest, loaded by `NewItemActionLoadHistory`.
  final List<ItemHistoryEntry> history;

  /// Items still to buy in the list, which aren't suggested again.
  final List<String> exclude;

  const NewItemState({
    required this.listId,
    required this.name,
    required this.itemId,
    required this.order,
    required this.loading,
    required this.savedEvent,
    this.history = const [],
    this.exclude = const [],
  });

  factory NewItemState.initial(
    String listId,
    String? name,
    String? itemId,
    int? order, {
    List<String> exclude = const [],
  }) {
    return NewItemState(
      listId: listId,
      name: name,
      itemId: itemId,
      order: order ?? DateTime.now().millisecondsSinceEpoch,
      loading: false,
      savedEvent: Event<String>.spent(),
      exclude: exclude,
    );
  }

  /// What to offer under the name field; only while adding a new item.
  List<String> get suggestions =>
      itemId == null ? suggestItems(name ?? '', history, exclude) : const [];

  NewItemState copyWith({
    String? listId,
    String? name,
    String? itemId,
    int? order,
    bool? loading,
    Event<String>? savedEvent,
    List<ItemHistoryEntry>? history,
    List<String>? exclude,
  }) {
    return NewItemState(
      listId: listId ?? this.listId,
      name: name ?? this.name,
      itemId: itemId ?? this.itemId,
      order: order ?? this.order,
      loading: loading ?? this.loading,
      savedEvent: savedEvent ?? this.savedEvent,
      history: history ?? this.history,
      exclude: exclude ?? this.exclude,
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
          savedEvent == other.savedEvent &&
          history == other.history &&
          exclude == other.exclude;

  @override
  int get hashCode =>
      listId.hashCode ^
      name.hashCode ^
      itemId.hashCode ^
      order.hashCode ^
      loading.hashCode ^
      savedEvent.hashCode ^
      history.hashCode ^
      exclude.hashCode;
}
