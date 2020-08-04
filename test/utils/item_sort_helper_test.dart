import 'package:flutter_test/flutter_test.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/item_sort.dart';

final _items = [
  ShoppingItem(id: "4", value: "4", order: 4, done: false),
  ShoppingItem(id: "3", value: "3", order: 3, done: true),
  ShoppingItem(id: "2", value: "2", order: 2, done: true),
  ShoppingItem(id: "1", value: "1", order: 1, done: false),
  ShoppingItem(id: "5", value: "5", order: 1, done: false),
  ShoppingItem(id: "6", value: "6", order: 1, done: true),
];

main() {
  group("sort", () {
    test("alpha", () async {
      final result = ItemSortHelper.sort(ItemSort.name, _items);

      expect(result[0].id, "1");
      expect(result[1].id, "2");
      expect(result[2].id, "3");
      expect(result[3].id, "4");
      expect(result[4].id, "5");
      expect(result[5].id, "6");
    });

    test("done", () async {
      final result = ItemSortHelper.sort(ItemSort.done, _items);

      expect(result[0].done, false);
      expect(result[1].done, false);
      expect(result[2].done, false);
      expect(result[3].done, true);
      expect(result[4].done, true);
      expect(result[5].done, true);
    });

    test("alpha + done", () async {
      final result = ItemSortHelper.sort(ItemSort.name_done, _items);
      expect(result[0].id, "1");
      expect(result[1].id, "4");
      expect(result[2].id, "5");
      expect(result[3].id, "2");
      expect(result[4].id, "3");
      expect(result[5].id, "6");
    });
  });
}
