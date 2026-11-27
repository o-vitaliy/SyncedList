import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_list/data/repos/suggestions_repo.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';

ItemHistoryEntry e(String v, int n, [int t = 0]) =>
    ItemHistoryEntry(value: v, count: n, lastUsed: t);

void main() {
  group('suggestItems', () {
    final history = [
      e('Milk', 5),
      e('Almond milk', 2),
      e('Buttermilk', 1),
      e('Mint', 1),
      e('Bread', 9),
    ];

    test('prefix matches first, then word starts, then anywhere', () {
      expect(suggestItems('mi', history, []), [
        'Milk',
        'Mint',
        'Almond milk',
        'Buttermilk',
      ]);
    });

    test('ignores case and extra spaces', () {
      expect(suggestItems('  MILK ', history, []), [
        'Almond milk',
        'Buttermilk',
      ]);
    });

    test('empty query offers the most used names', () {
      expect(suggestItems('', history, [], limit: 2), ['Bread', 'Milk']);
    });

    test('leaves out items still to buy', () {
      expect(suggestItems('', history, ['bread', 'MILK'], limit: 1), [
        'Almond milk',
      ]);
    });

    test('ties go to the most recent', () {
      final h = [e('Mint', 1, 1), e('Mince', 1, 2)];
      expect(suggestItems('min', h, []), ['Mince', 'Mint']);
    });
  });

  group('SuggestionsRepo', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      GetIt.I.registerSingleton(PrefsDataSource());
    });
    tearDown(() => GetIt.I.reset());

    test('counts added names and keeps them across instances', () async {
      final repo = SuggestionsRepo();
      await repo.record('Milk');
      await repo.record(' milk ');
      await repo.remember(['Milk', 'Eggs']);

      final history = await SuggestionsRepo().getHistory();
      expect(history.map((h) => (h.value, h.count)), [
        ('milk', 2),
        ('Eggs', 0),
      ]);
    });

    test('clear forgets everything', () async {
      final repo = SuggestionsRepo();
      await repo.record('Milk');
      await repo.clear();
      expect(await SuggestionsRepo().getHistory(), isEmpty);
    });

    test('drops the least used names past the limit', () async {
      final repo = SuggestionsRepo();
      await repo.record('Keep');
      await repo.remember([for (var i = 0; i < maxHistory; i++) 'item $i']);
      final history = await SuggestionsRepo().getHistory();
      expect(history, hasLength(maxHistory));
      expect(history.map((h) => h.value), contains('Keep'));
    });

    test('survives unreadable saved history', () async {
      SharedPreferences.setMockInitialValues({'itemHistory': 'not json'});
      await GetIt.I.reset();
      GetIt.I.registerSingleton(PrefsDataSource());
      expect(await SuggestionsRepo().getHistory(), isEmpty);
    });
  });
}
