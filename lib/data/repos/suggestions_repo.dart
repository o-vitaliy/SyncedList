import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';

const _key = "itemHistory";

/// How many names the history keeps; the least used, oldest go first.
const maxHistory = 300;

/// An item name the user has added or seen in one of their lists.
@immutable
class ItemHistoryEntry {
  final String value;

  /// How many times this user added it.
  final int count;

  /// When it was last added or seen, in milliseconds since epoch.
  final int lastUsed;

  const ItemHistoryEntry({
    required this.value,
    required this.count,
    required this.lastUsed,
  });

  String get key => normalize(value);

  factory ItemHistoryEntry.fromMap(Map<String, dynamic> map) =>
      ItemHistoryEntry(
        value: map['v'] as String,
        count: map['n'] as int,
        lastUsed: map['t'] as int,
      );

  Map<String, dynamic> toMap() => {'v': value, 'n': count, 't': lastUsed};

  @override
  bool operator ==(Object other) =>
      other is ItemHistoryEntry &&
      value == other.value &&
      count == other.count &&
      lastUsed == other.lastUsed;

  @override
  int get hashCode => value.hashCode ^ count.hashCode ^ lastUsed.hashCode;
}

String normalize(String value) =>
    value.trim().replaceAll(RegExp(r'\s+'), ' ').toLowerCase();

/// Item names this device has added or seen, offered as suggestions while
/// adding an item. Kept in SharedPreferences and cleared on sign-out.
class SuggestionsRepo {
  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  Map<String, ItemHistoryEntry>? _cache;

  Future<Map<String, ItemHistoryEntry>> _load() async {
    final cached = _cache;
    if (cached != null) return cached;
    final result = <String, ItemHistoryEntry>{};
    final json = await _prefs.getString(_key);
    if (json != null) {
      try {
        for (final e in jsonDecode(json) as List) {
          final entry = ItemHistoryEntry.fromMap(e as Map<String, dynamic>);
          if (entry.key.isNotEmpty) result[entry.key] = entry;
        }
      } catch (_) {
        // Unreadable history: start over rather than fail adding items.
      }
    }
    return _cache = result;
  }

  Future _save(Map<String, ItemHistoryEntry> items) {
    var entries = items.values.toList();
    if (entries.length > maxHistory) {
      entries.sort(compareByUse);
      entries = entries.sublist(0, maxHistory);
      _cache = {for (final e in entries) e.key: e};
    }
    return _prefs.setString(
      _key,
      jsonEncode(entries.map((e) => e.toMap()).toList()),
    );
  }

  Future<List<ItemHistoryEntry>> getHistory() async =>
      (await _load()).values.toList();

  /// The user added (or renamed an item to) [value].
  Future record(String value, {DateTime? now}) async {
    final key = normalize(value);
    if (key.isEmpty) return;
    final items = await _load();
    final old = items[key];
    items[key] = ItemHistoryEntry(
      value: value.trim(),
      count: (old?.count ?? 0) + 1,
      lastUsed: (now ?? DateTime.now()).millisecondsSinceEpoch,
    );
    await _save(items);
  }

  /// Names seen in a list, possibly added by other members. Only new ones are
  /// stored, so they don't outrank what this user adds.
  Future remember(Iterable<String> values, {DateTime? now}) async {
    final items = await _load();
    final time = (now ?? DateTime.now()).millisecondsSinceEpoch;
    var changed = false;
    for (final value in values) {
      final key = normalize(value);
      if (key.isEmpty || items.containsKey(key)) continue;
      items[key] = ItemHistoryEntry(
        value: value.trim(),
        count: 0,
        lastUsed: time,
      );
      changed = true;
    }
    if (changed) await _save(items);
  }

  Future clear() async {
    _cache = {};
    await _prefs.setString(_key, '[]');
  }
}

/// Most added first, then most recent.
int compareByUse(ItemHistoryEntry a, ItemHistoryEntry b) {
  final byCount = b.count.compareTo(a.count);
  return byCount != 0 ? byCount : b.lastUsed.compareTo(a.lastUsed);
}

/// Suggestions for what the user typed in [query]: names starting with it,
/// then names with a word starting with it, then names containing it, each
/// most used first. With an empty query, the most used names. Leaves out
/// [exclude] (items still to buy in the list) and the query itself.
List<String> suggestItems(
  String query,
  Iterable<ItemHistoryEntry> history,
  Iterable<String> exclude, {
  int limit = 6,
}) {
  final q = normalize(query);
  final skip = {for (final e in exclude) normalize(e), q};
  final groups = <List<ItemHistoryEntry>>[[], [], []];
  for (final entry in history) {
    final key = entry.key;
    if (skip.contains(key)) continue;
    if (q.isEmpty || key.startsWith(q)) {
      groups[0].add(entry);
    } else if (key.contains(' $q')) {
      groups[1].add(entry);
    } else if (key.contains(q)) {
      groups[2].add(entry);
    }
  }
  return [for (final group in groups) ...(group..sort(compareByUse))]
      .take(limit)
      .map((e) => e.value)
      .toList();
}
