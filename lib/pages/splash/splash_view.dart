import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'splash_init_action.dart';

class SplashView extends StatelessWidget {
  const SplashView();

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch<AppState>(context, SplashInitAction());
    return _Content();
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: LoadingIndicator());
  }
}
