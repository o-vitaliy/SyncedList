import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/repos/auth_repo.dart';

import 'base_login.dart';

class LoginAsAnonymousAction extends BaseLogin {
  @override
  Future login() => GetIt.I.get<AuthRepo>().loginAsAnonymous();
}