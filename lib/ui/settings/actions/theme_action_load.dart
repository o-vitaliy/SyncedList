import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/theme_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class ThemeActionLoad extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final mode = await GetIt.I.get<ThemeRepo>().getThemeMode();
    return state.copyWith(themeMode: mode);
  }
}
