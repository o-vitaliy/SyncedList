import 'package:flutter/material.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

enum ItemSort { name, done, name_done }

typedef int Comparator(ShoppingItem a, ShoppingItem b);

final Comparator _nameComparator = (ShoppingItem a, ShoppingItem b) {
  return a.value.compareTo(b.value);
};

final Comparator _doneComparator = (ShoppingItem a, ShoppingItem b) {
  return a.done == b.done ? 0 : (a.done ? 1 : -1);
};

class ItemSortHelper {
  static ItemSort fromString(String sort) {
    switch (sort) {
      case "name":
        return ItemSort.name;
      case "done":
        return ItemSort.done;
      case "name_done":
        return ItemSort.name_done;
      default:
        throw UnsupportedError("unknown type $sort");
    }
  }

  static String toStr(ItemSort sort) {
    switch (sort) {
      case ItemSort.name:
        return "name";
      case ItemSort.done:
        return "done";
      case ItemSort.name_done:
        return "name_done";
      default:
        throw UnsupportedError("unknown type $sort");
    }
  }

  static IconData getIcon(ItemSort sort) {
    switch (sort) {
      case ItemSort.name:
        return Icons.sort_by_alpha;
      case ItemSort.done:
        return Icons.done;
      case ItemSort.name_done:
        return Icons.spellcheck;
      default:
        throw UnsupportedError("unknown type $sort");
    }
  }

  static String getTitle(BuildContext context, ItemSort sort) {
    final l = L.of(context);
    switch (sort) {
      case ItemSort.name:
        return l.sort.name;
      case ItemSort.done:
        return l.sort.done;
      case ItemSort.name_done:
        return l.sort.nameDone;
      default:
        throw UnsupportedError("unknown type $sort");
    }
  }

  static List<ShoppingItem> sort(ItemSort sort, Iterable<ShoppingItem> items) {
    final result = items.toList(growable: false);
    if (ItemSort.name == sort) result.sort(_nameComparator);
    if (ItemSort.done == sort) result.sort(_doneComparator);
    if (ItemSort.name_done == sort) {
      result.sort(_nameComparator);
      result.sort(_doneComparator);
    }
    return result;
  }
}