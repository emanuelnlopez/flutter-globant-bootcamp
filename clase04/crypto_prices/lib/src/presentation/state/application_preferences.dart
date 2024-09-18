import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesKeys {
  static const favoriteCryptos = 'favoriteCryptos';
  static const onlyFavorites = 'onlyFavorites';
  static const darkMode = 'darkMode';
}

class ApplicationPreferences with ChangeNotifier, WidgetsBindingObserver {
  ApplicationPreferences({
    required SharedPreferences preferences,
  }) : _preferences = preferences {
    _favoriteCryptos.addAll(
      _preferences.getStringList(PreferencesKeys.favoriteCryptos) ?? [],
    );
    _darkMode = _preferences.getBool(PreferencesKeys.darkMode) ?? false;
    _onlyFavorites =
        _preferences.getBool(PreferencesKeys.onlyFavorites) ?? false;
    WidgetsBinding.instance.addObserver(this);
  }

  final _favoriteCryptos = <String>{};
  final _logger = Logger('ApplicationPreferences');
  final SharedPreferences _preferences;

  late bool _darkMode;
  late bool _onlyFavorites;

  Set<String> get favoriteCryptos => _favoriteCryptos;
  bool get darkMode => _darkMode;
  bool get onlyFavorites => _onlyFavorites;

  void toggleFavoriteCrypto(String id) {
    if (_favoriteCryptos.contains(id)) {
      _favoriteCryptos.remove(id);
    } else {
      _favoriteCryptos.add(id);
    }
    notifyListeners();
  }

  void toggleTheme() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  void toggleOnlyFavorite() {
    _onlyFavorites = !_onlyFavorites;
    notifyListeners();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      _updatePreferences();
    }
  }

  void _updatePreferences() async {
    _logger.finest('Updating preferences...');
    await _preferences.setStringList(
      PreferencesKeys.favoriteCryptos,
      _favoriteCryptos.toList(growable: false),
    );
    await _preferences.setBool(PreferencesKeys.darkMode, _darkMode);
    await _preferences.setBool(PreferencesKeys.onlyFavorites, _onlyFavorites);
  }
}
