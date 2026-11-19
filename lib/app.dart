import 'package:async_redux/async_redux.dart';
import 'package:app_links/app_links.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/ui/auth/login_screen.dart';
import 'package:shopping_list/ui/list/items_list/item_list_view.dart';
import 'package:shopping_list/ui/splash/splash_screen.dart';

import 'localization.dart';
import 'main.dart';
import 'state/app_state.dart';
import 'deeplinks/deeplink.dart';
import 'ui/list/new_list/actions/new_list_action_from_deeplink.dart';
import 'ui/list/user_list/user_lists_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routes = {
  '/': (BuildContext context) => const SplashConnector(),
  "/login": (BuildContext context) => const LoginScreen(),
  "/main": (BuildContext context) => const UserListsView(),
  "/items": (BuildContext context) => const ListItemsView(),
};

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: mainStore,
      child: MaterialApp(
        routes: routes,
        // Shows UserExceptions from any action, via NavigateAction.navigatorKey.
        builder: (context, child) =>
            UserExceptionDialog<AppState>(child: child!),
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primaryColor: const Color(0xFFDC5607),
          primaryColorDark: const Color(0xFFA32400),
          primaryColorLight: const Color(0xFFFF873D),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFDC5607)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFFDC5607),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC5607),
              foregroundColor: Colors.white,
            ),
          ),
        ),
        localizationsDelegates: appLocalizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
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
