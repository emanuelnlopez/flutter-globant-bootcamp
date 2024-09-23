import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesKeys {
  static const loggedIn = 'loggedIn';
}

class UserController with ChangeNotifier {
  UserController({
    required SharedPreferences preferences,
  }) : _preferences = preferences {
    _loggedIn = _preferences.getBool(PreferencesKeys.loggedIn) ?? false;
  }

  final SharedPreferences _preferences;

  late bool _loggedIn;

  bool get loggedIn => _loggedIn;

  Future<void> logIn() async {
    await _preferences.setBool(PreferencesKeys.loggedIn, true);
    _loggedIn = true;
    notifyListeners();
  }

  Future<void> logOut() async {
    await _preferences.setBool(PreferencesKeys.loggedIn, false);
    _loggedIn = false;
    notifyListeners();
  }

  Future<void> signUp() async => logIn();
}
