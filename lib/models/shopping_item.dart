class ShoppingItem {
  final String id;
  final String value;
  final int order;
  final bool done;

  ShoppingItem({this.id, this.value, this.order, this.done});

  factory ShoppingItem.fromMap(Map<dynamic, dynamic> map) {
    return new ShoppingItem(
      id: map['id'] as String,
      value: map['value'] as String,
      order: map['order'] as int,
      done: map['done'] as bool,
    );
  }

  Map<dynamic, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'value': this.value,
      'order': this.order,
      'done': this.done,
    } as Map<String, dynamic>;
  }

  ShoppingItem copyWith({
    String id,
    String value,
    int order,
    bool done,
  }) {
    return new ShoppingItem(
      id: id ?? this.id,
      value: value ?? this.value,
      order: order ?? this.order,
      done: done != null ? done : this.done,
    );
  }

  static List<ShoppingItem> from(v) {
    if (v == null) {
      return List<ShoppingItem>();
    } else if (v is Iterable) {
      return v.map((e) => ShoppingItem.fromMap(e)).toList();
    } else {
      return List<ShoppingItem>()..add(ShoppingItem.fromMap(v));
    }
  }

  static List<Map<dynamic, dynamic>> toListMap(List<ShoppingItem> v) {
    return v.map((e) => e.toMap()).toList(growable: false);
  }
}
