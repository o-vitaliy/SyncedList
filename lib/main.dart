import 'package:async_redux/async_redux.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_shopping_list/pages/auth/singup/register_view.dart';
import 'package:shared_shopping_list/pages/main/new_list/new_list_action_from_deeplink.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_lists_view.dart';

import 'app/app_state.dart';
import 'dependencies.dart';
import 'l.dart';
import 'pages/auth/login/login_view.dart';
import 'pages/main/items_list/item_list_view.dart';
import 'pages/splash/splash_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final mainStore = Store(initialState: AppState.initial());

Future<Null> main() async {
  NavigateAction.setNavigatorKey(navigatorKey);

  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp(mainStore));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          title: 'SyncedList',
          routes: _routes(),
          theme: ThemeData.light().copyWith(
              primaryColor: Color(0xFFDC5607),
              primaryColorDark: Color(0xFFA32400),
              primaryColorLight: Color(0xFFFF873D),
              accentColor: Color(0xFFFFE74C),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Color(0xFFDC5607))),
          initialRoute: "/",
          navigatorKey: navigatorKey,
          localizationsDelegates: _localizationsDelegates(),
          supportedLocales: L.languages.keys.toList(),
        ));
  }

  Map<String, WidgetBuilder> _routes() {
    return <String, WidgetBuilder>{
      "/": (_) => const SplashView(),
      "/login": (_) => LoginView(),
      "/registration": (_) => RegisterView(),
      "/main": (_) => UserListsView(),
      "/items": (_) => ListItemsView()
    };
  }

  Iterable<LocalizationsDelegate<dynamic>> _localizationsDelegates() {
    return [
      const LDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        widget.store.dispatch(NewListActionFromDeepLink(
          params: deepLink.queryParameters,
        ));
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      widget.store.dispatch(NewListActionFromDeepLink(
        params: deepLink.queryParameters,
      ));
    }
  }
}
