import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_list/data/entities/app_theme_mode.dart';
import 'package:shopping_list/data/repos/theme_repo.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    GetIt.I.registerSingleton(PrefsDataSource());
  });
  tearDown(() => GetIt.I.reset());

  test('defaults to following the system theme', () async {
    expect(await ThemeRepo().getThemeMode(), AppThemeMode.system);
  });

  test('remembers the chosen theme', () async {
    final repo = ThemeRepo();
    await repo.setThemeMode(AppThemeMode.dark);
    expect(await repo.getThemeMode(), AppThemeMode.dark);
  });

  test('falls back to system for an unknown saved value', () async {
    SharedPreferences.setMockInitialValues({'themeMode': 'sepia'});
    await GetIt.I.reset();
    GetIt.I.registerSingleton(PrefsDataSource());
    expect(await ThemeRepo().getThemeMode(), AppThemeMode.system);
  });
}
