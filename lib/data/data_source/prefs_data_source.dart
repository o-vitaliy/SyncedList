import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsDataSource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // bool
  Future<bool> getBool(String key, {bool def = false}) async {
    final prefs = (await _prefs);
    return prefs.getBool(key) ?? def;
  }

  Future setBool(String key, bool value) async {
    (await _prefs).setBool(key, value);
  }

  // int
  Future<int> getInt(String key, {int def = 0}) async {
    final prefs = (await _prefs);
    return prefs.getInt(key) ?? def;
  }

  Future setInt(String key, int value) async {
    (await _prefs).setInt(key, value);
  }

  // double
  Future<double> getDouble(String key, {double def = 0}) async {
    final prefs = (await _prefs);
    return prefs.getDouble(key) ?? def;
  }

  Future setDouble(String key, double value) async {
    (await _prefs).setDouble(key, value);
  }

  // string
  Future<String> getString(String key, {String def}) async {
    final prefs = (await _prefs);
    return prefs.getString(key) ?? def;
  }

  Future setString(String key, String value) async {
    (await _prefs).setString(key, value);
  }
}
