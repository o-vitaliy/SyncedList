class NewShoppingItem {
  final String value;
  final int order;
  final bool done;

  NewShoppingItem({
    required this.value,
    required this.order,
    required this.done,
  });

  factory NewShoppingItem.fromMap(Map<dynamic, dynamic> map) {
    return NewShoppingItem(
      value: map['value'] as String,
      order: map['order'] as int,
      done: map['done'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'value': value,
      'order': order,
      'done': done,
    } as Map<String, dynamic>;
  }

  NewShoppingItem copyWith({
    String? value,
    int? order,
    bool? done,
  }) {
    return NewShoppingItem(
      value: value ?? this.value,
      order: order ?? this.order,
      done: done ?? this.done,
    );
  }

  static List<NewShoppingItem> from(v) {
    if (v == null) {
      return <NewShoppingItem>[];
    } else if (v is Iterable) {
      return v.map((e) => NewShoppingItem.fromMap(e)).toList();
    } else {
      return <NewShoppingItem>[NewShoppingItem.fromMap(v)];
    }
  }

  static List<Map<dynamic, dynamic>> toListMap(List<NewShoppingItem> v) {
    return v.map((e) => e.toMap()).toList(growable: false);
  }
}
