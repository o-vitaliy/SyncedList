import 'dart:async';

import 'package:get_it/get_it.dart';

import 'prefs_data_source.dart';

const keyLogin = "login";
const keyToken = "token";

class UserPrefsDataSource {
  PrefsDataSource get _prefsDataSource => GetIt.I.get<PrefsDataSource>();

  Future setLogin(String login) {
    return _prefsDataSource.setString(keyLogin, login);
  }

  Future<String> getLogin() {
    return _prefsDataSource.getString(keyLogin);
  }

  Future setToken(String token) {
    return _prefsDataSource.setString(keyToken, token);
  }

  Future<String> getToken() {
    return _prefsDataSource.getString(keyToken);
  }
}
