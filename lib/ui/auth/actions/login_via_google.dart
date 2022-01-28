import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/auth/auth_datasource.dart';
import 'package:give_a_ride/state/app_state.dart';

import 'base_login.dart';

class LoginViaGoogle extends BaseLogin {
  @override
  Future login() => GetIt.I.get<AuthDataSource>().loginViaGoogle();
}
