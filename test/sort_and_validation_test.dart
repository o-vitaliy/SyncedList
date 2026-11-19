import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/data/repos/sort_repo.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';
import 'package:shopping_list/data/validators/empty_validator.dart';

void main() {
  group('SortRepo.getSort', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      GetIt.I.registerSingleton(PrefsDataSource());
    });
    tearDown(() => GetIt.I.reset());

    test('defaults to sorting by done', () async {
      expect(await SortRepo().getSort(), ItemSort.done);
    });

    test('returns null after a one-time sort clears auto sorts', () async {
      final repo = SortRepo();
      await repo.clear();
      expect(await repo.getSort(), isNull);
    });

    test('returns null when every auto sort is unchecked', () async {
      final repo = SortRepo();
      await repo.removeSort(ItemSort.done);
      expect(await repo.getSort(), isNull);
    });

    test('combines name and done', () async {
      final repo = SortRepo();
      await repo.addSort(ItemSort.name);
      expect(await repo.getSort(), ItemSort.nameDone);
    });
  });

  test('EmptyValidator rejects null, empty and blank values', () {
    final v = EmptyValidator();
    expect(v.valid(null, 'err'), 'err');
    expect(v.valid('', 'err'), 'err');
    expect(v.valid('   ', 'err'), 'err');
    expect(v.valid('Milk', 'err'), isNull);
  });
}
