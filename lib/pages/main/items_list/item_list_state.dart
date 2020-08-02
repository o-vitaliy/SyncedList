import 'package:flutter/foundation.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/models/user_list.dart';

@immutable
class ItemListState {
  final UserList list;
  final bool loading;
  final List<ShoppingItem> items;

  factory ItemListState.initial(UserList list) {
    return ItemListState(loading: true, list: list, items: []);
  }

  //<editor-fold desc="Data Methods" defaultstate="collapsed">
  const ItemListState({
    @required this.list,
    @required this.loading,
    @required this.items,
  });

  ItemListState copyWith({
    UserList list,
    bool loading,
    List<ShoppingItem> items,
  }) {
    if ((list == null || identical(list, this.list)) &&
        (loading == null || identical(loading, this.loading)) &&
        (items == null || identical(items, this.items))) {
      return this;
    }

    return new ItemListState(
      list: list ?? this.list,
      loading: loading ?? this.loading,
      items: items ?? this.items,
    );
  }

  @override
  String toString() {
    return 'ItemListState{list: $list, loading: $loading, items: $items}';
  }

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

//</editor-fold>

}
