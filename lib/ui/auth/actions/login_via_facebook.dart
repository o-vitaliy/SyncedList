import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';

import 'base_login.dart';

class LoginViaFacebook extends BaseLogin {
  @override
  Future login() => GetIt.I.get<AuthRepo>().loginViaFacebook();
}
