import 'package:async_redux/async_redux.dart';
import 'package:app_links/app_links.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/ui/auth/login_screen.dart';
import 'package:shopping_list/ui/legal/legal_content.dart';
import 'package:shopping_list/ui/legal/legal_screen.dart';
import 'package:shopping_list/ui/list/items_list/item_list_view.dart';
import 'package:shopping_list/ui/splash/splash_screen.dart';

import 'localization.dart';
import 'main.dart';
import 'state/app_state.dart';
import 'deeplinks/deeplink.dart';
import 'ui/list/new_list/actions/new_list_action_from_deeplink.dart';
import 'ui/list/user_list/user_lists_view.dart';
import 'ui/theme/app_theme.dart';
import 'ui/widgets/widgets.dart';
import 'data/entities/app_theme_mode.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routes = {
  '/': (BuildContext context) => const SplashConnector(),
  "/login": (BuildContext context) => const LoginScreen(),
  "/main": (BuildContext context) => const UserListsView(),
  "/items": (BuildContext context) => const ListItemsView(),
  "/terms": (BuildContext context) =>
      const LegalScreen(type: LegalDocType.terms),
  "/privacy": (BuildContext context) =>
      const LegalScreen(type: LegalDocType.privacy),
};

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: mainStore,
      child: StoreConnector<AppState, AppThemeMode>(
        converter: (store) => store.state.themeMode,
        builder: (context, mode) => _app(_toThemeMode(mode)),
      ),
    );
  }

  static ThemeMode _toThemeMode(AppThemeMode mode) => switch (mode) {
    AppThemeMode.system => ThemeMode.system,
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
  };

  Widget _app(ThemeMode themeMode) {
    return MaterialApp(
      routes: routes,
      // Shows UserExceptions from any action, via NavigateAction.navigatorKey.
      builder: (context, child) => UserExceptionDialog<AppState>(child: child!),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

final _appLinks = AppLinks();

/// Listens for list-share links (see [Deeplink]). The stream also emits the
/// link the app was launched with.
void initDeepLinks() {
  _appLinks.uriLinkStream.listen((Uri uri) {
    if (Deeplink.isListLink(uri)) {
      mainStore.dispatch(
        NewListActionFromDeepLink(params: uri.queryParameters),
      );
    }
  });
}
