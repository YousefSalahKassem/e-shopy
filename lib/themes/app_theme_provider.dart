import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.read(AppSharedPreferences.provider)),
  );

  //* Dependency
  late final SharedPreferences _sharedPreferences;

  //* State
  ThemeFlavor _themeFlavor = ThemeFlavor.light;

  //* Getters
  ThemeFlavor get themeFlavor => _themeFlavor;

  //* Constructor and Methods

  // this test
  AppTheme(this._sharedPreferences) {
    // Load Theme as soon as the provider is created
    load();
  }

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    _themeFlavor = flavor;
    await _sharedPreferences.setString(kSavedThemeStringKey, flavor.name);
    notifyListeners();
  }

  void load() {
    final String? savedFlavor =
        _sharedPreferences.getString(kSavedThemeStringKey);
    if (savedFlavor != null) {
      setThemeFlavor(_flavorFromString(savedFlavor));
    }
  }

  ThemeFlavor _flavorFromString(String flavorString) {
    return ThemeFlavor.values.firstWhere(
      (flavor) => flavor.name == flavorString,
      //default value
      orElse: () => ThemeFlavor.values.first,
    );
  }
}
