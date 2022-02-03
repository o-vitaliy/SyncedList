class ShoppingItem {
  final String id;
  final String value;
  final int order;
  final bool done;

  ShoppingItem({
    required this.id,
    required this.value,
    required this.order,
    required this.done,
  });

  factory ShoppingItem.fromMap(Map<dynamic, dynamic> map) {
    return ShoppingItem(
      id: map['id'] as String,
      value: map['value'] as String,
      order: map['order'] as int,
      done: map['done'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': id,
      'value': value,
      'order': order,
      'done': done,
    } as Map<String, dynamic>;
  }

  ShoppingItem copyWith({
    String? id,
    String? value,
    int? order,
    bool? done,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      value: value ?? this.value,
      order: order ?? this.order,
      done: done ?? this.done,
    );
  }

  static List<ShoppingItem> from(v) {
    if (v == null) {
      return <ShoppingItem>[];
    } else if (v is Iterable) {
      return v.map((e) => ShoppingItem.fromMap(e)).toList();
    } else {
      return <ShoppingItem>[ShoppingItem.fromMap(v)];
    }
  }

  static List<Map<dynamic, dynamic>> toListMap(List<ShoppingItem> v) {
    return v.map((e) => e.toMap()).toList(growable: false);
  }
}
