import 'package:async_redux/async_redux.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_list/ui/auth/login_screen.dart';
import 'package:shopping_list/ui/list/items_list/item_list_view.dart';
import 'package:shopping_list/ui/splash/splash_screen.dart';

import 'localization.dart';
import 'main.dart';
import 'state/app_state.dart';
import 'ui/list/new_list/actions/new_list_action_from_deeplink.dart';
import 'ui/list/user_list/user_lists_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routes = {
  '/': (BuildContext context) => const SplashConnector(),
  "/login": (BuildContext context) => const LoginScreen(),
  "/main": (BuildContext context) => const UserListsView(),
  "/items": (BuildContext context) => const ListItemsView()
};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: mainStore,
      child: MaterialApp(
        routes: routes,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primaryColor: const Color(0xFFDC5607),
          primaryColorDark: const Color(0xFFA32400),
          primaryColorLight: const Color(0xFFFF873D),
          appBarTheme: const AppBarTheme(color: Color(0xFFDC5607)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xFFDC5607)),
        ),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: localizedLabels.keys.toList(),
      ),
    );
  }
}

void initDynamicLinks() async {
  FirebaseDynamicLinks.instance.onLink
      .listen((PendingDynamicLinkData dynamicLink) async {
    final Uri? deepLink = dynamicLink.link;

    if (deepLink != null) {
      mainStore.dispatch(NewListActionFromDeepLink(
        params: deepLink.queryParameters,
      ));
    }
  });

  final PendingDynamicLinkData? data =
      await FirebaseDynamicLinks.instance.getInitialLink();
  final Uri? deepLink = data?.link;

  if (deepLink != null) {
    mainStore.dispatch(NewListActionFromDeepLink(
      params: deepLink.queryParameters,
    ));
  }
}
