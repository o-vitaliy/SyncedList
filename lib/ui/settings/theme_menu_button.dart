import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/app_theme_mode.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';

import 'actions/theme_action_change.dart';

/// App bar button for choosing System / Light / Dark theme.
class ThemeMenuButton extends StatelessWidget {
  const ThemeMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppThemeMode>(
      converter: (store) => store.state.themeMode,
      builder: (context, current) {
        final l = AppLocalizations.of(context);
        return PopupMenuButton<AppThemeMode>(
          tooltip: l.themeTitle,
          icon: Icon(_icon(current)),
          initialValue: current,
          onSelected: (mode) => StoreProvider.dispatch<AppState>(
            context,
            ThemeActionChange(mode),
          ),
          itemBuilder: (context) => [
            for (final mode in AppThemeMode.values)
              CheckedPopupMenuItem(
                value: mode,
                checked: mode == current,
                child: Text(_label(l, mode)),
              ),
          ],
        );
      },
    );
  }

  static IconData _icon(AppThemeMode mode) => switch (mode) {
    AppThemeMode.system => Icons.brightness_auto_outlined,
    AppThemeMode.light => Icons.light_mode_outlined,
    AppThemeMode.dark => Icons.dark_mode_outlined,
  };

  static String _label(AppLocalizations l, AppThemeMode mode) => switch (mode) {
    AppThemeMode.system => l.themeSystem,
    AppThemeMode.light => l.themeLight,
    AppThemeMode.dark => l.themeDark,
  };
}
