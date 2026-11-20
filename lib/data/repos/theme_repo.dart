import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/app_theme_mode.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';

const _key = "themeMode";

class ThemeRepo {
  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  Future<AppThemeMode> getThemeMode() async {
    final name = await _prefs.getString(_key);
    return AppThemeMode.values.firstWhere(
      (e) => e.name == name,
      orElse: () => AppThemeMode.system,
    );
  }

  Future setThemeMode(AppThemeMode mode) => _prefs.setString(_key, mode.name);
}
