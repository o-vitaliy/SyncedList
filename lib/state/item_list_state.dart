import 'package:give_a_ride/data/entities/shopping_item.dart';
import 'package:give_a_ride/data/entities/user_list.dart';

class ItemListState {
  final UserList list;
  final bool loading;
  final List<ShoppingItem> items;

  factory ItemListState.initial(UserList list) {
    return ItemListState(loading: true, list: list, items: []);
  }

//<editor-fold desc="Data Methods">

  const ItemListState({
    required this.list,
    required this.loading,
    required this.items,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemListState &&
          runtimeType == other.runtimeType &&
          list == other.list &&
          loading == other.loading &&
          items == other.items);

  @override
  int get hashCode => list.hashCode ^ loading.hashCode ^ items.hashCode;

  @override
  String toString() {
    return 'ItemListState{' +
        ' list: $list,' +
        ' loading: $loading,' +
        ' items: $items,' +
        '}';
  }

  ItemListState copyWith({
    UserList? list,
    bool? loading,
    List<ShoppingItem>? items,
  }) {
    return ItemListState(
      list: list ?? this.list,
      loading: loading ?? this.loading,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'list': list,
      'loading': loading,
      'items': items,
    };
  }

  factory ItemListState.fromMap(Map<String, dynamic> map) {
    return ItemListState(
      list: map['list'] as UserList,
      loading: map['loading'] as bool,
      items: map['items'] as List<ShoppingItem>,
    );
  }

//</editor-fold>
}
