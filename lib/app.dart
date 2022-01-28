import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:give_a_ride/ui/auth/login_screen.dart';
import 'package:give_a_ride/ui/list/shopping_list_screen.dart';
import 'package:give_a_ride/ui/splash/splash_screen.dart';

import 'main.dart';
import 'state/app_state.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routes = {
  '/': (BuildContext context) => const SplashConnector(),
  "/login": (BuildContext context) => const LoginScreen(),
  "/main": (BuildContext context) => const ShoppingListScreen(),
};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        routes: routes,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
