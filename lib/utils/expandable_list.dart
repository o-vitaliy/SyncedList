extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }

  void forEachIndex(void f(E e, int i)) {
    var i = 0;
    this.forEach((e) => f(e, i++));
  }

  E findOrNull(bool test(E e)) {
    return firstWhere(test, orElse: () => null);
  }

  E firstOrNull() {
    if (length > 0) return first;
    return null;
  }
}

Map<T, List<E>> groupBy<E, T>(Iterable<E> values, T key(E e)) {
  var map = <T, List<E>>{};
  for (var e in values) {
    var list = map.putIfAbsent(key(e), () => []);
    list.add(e);
  }
  return map;
}
