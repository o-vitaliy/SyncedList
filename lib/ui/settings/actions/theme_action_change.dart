import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/app_theme_mode.dart';
import 'package:shopping_list/data/repos/theme_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class ThemeActionChange extends ReduxAction<AppState> {
  final AppThemeMode mode;

  ThemeActionChange(this.mode);

  @override
  AppState reduce() {
    GetIt.I.get<ThemeRepo>().setThemeMode(mode);
    return state.copyWith(themeMode: mode);
  }
}
