import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/data_source/prefs_data_source.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/item_sort.dart';

const parts = "=";
const itemsJoint = "&";
const paramsJoint = "?";

const _key = "sorts";

class SortRepo {
  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  Future<Set<ItemSort>> getList() async {
    final json = (await _prefs.getString(_key, def: "[]"));

    final decoder = JsonDecoder();
    final items = decoder.convert(json);

    return items.map((e) => ItemSortHelper.fromString(e));
  }

  Future _saveList(Iterable<ItemSort> items) {
    final v = items.map((e) => ItemSortHelper.toStr(e)).toList(growable: false);
    final encoder = JsonEncoder();
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
}
