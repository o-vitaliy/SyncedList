import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';

const _key = "sorts";

class SortRepo {
  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  Future<Set<ItemSort>> getList() async {
    final json = (await _prefs.getString(_key)) ?? "[\"done\"]";

    const decoder = JsonDecoder();
    final items = decoder.convert(json);

    return Set<ItemSort>.from(items.map((e) => ItemSortHelper.fromString(e)));
  }

  Future<ItemSort?> getSort() async {
    final items = await getList();
    return items.length == 2 ? ItemSort.nameDone : items.first;
  }

  Future _saveList(Iterable<ItemSort> items) {
    final v = items.map((e) => ItemSortHelper.toStr(e)).toList(growable: false);
    const encoder = JsonEncoder();
    return _prefs.setString(_key, encoder.convert(v));
  }

  Future addSort(ItemSort sort) async {
    final items = (await getList())..add(sort);
    return _saveList(items);
  }

  Future removeSort(ItemSort sort) async {
    final items = (await getList())..remove(sort);
    return _saveList(items);
  }

  Future clear() async {
    return _saveList([]);
  }
}
