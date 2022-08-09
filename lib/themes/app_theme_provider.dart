import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ### [AppTheme] provider hold the current theme flavor
///
/// use [AppTheme.provider] in riverpod to watch the provider and
/// get current theme flavor,default flavor is the first flavor in [ThemeFlavor]
///
/// change the flavor by call [setThemeFlavor].
///
/// [AppTheme] use [SharedPreferences] to cache the current theme flavor,
/// [savedThemeStringKey] is key used to save the flavor,
/// saved value is the flavor name.
class AppTheme extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.watch(AppSharedPreferences.provider)),
  );

  //* Dependency
  late final SharedPreferences _sharedPreferences;

  //* State
  ThemeFlavor _themeFlavor = ThemeFlavor.values.first;

  //* Getters
  ThemeFlavor get themeFlavor => _themeFlavor;

  //* Constructor and Methods

  // this test
  AppTheme(this._sharedPreferences) {
    // Load Theme as soon as the provider is created
    ensureInitialized();
  }
  /// ### change current flavor.
  ///
  /// save the new flavor in [SharedPreferences].
  ///
  /// use notifyListeners to update any widget watch [AppTheme] provider.
  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    _themeFlavor = flavor;
    await _sharedPreferences.setString(savedThemeStringKey, flavor.name);
    notifyListeners();
  }
  ///get saved flavor and apply it.
  void ensureInitialized() {
    final String? savedFlavor =
        _sharedPreferences.getString(savedThemeStringKey);
    if (savedFlavor != null) {
      setThemeFlavor(_flavorFromString(savedFlavor));
    }
  }

  /// ### convert string to [ThemeFlavor].
  ///
  /// if the string not mach any flavor name in [ThemeFlavor]
  /// will return the first flavor in [ThemeFlavor].
  ThemeFlavor _flavorFromString(String flavorString) {
    return ThemeFlavor.values.firstWhere(
      (flavor) => flavor.name == flavorString,
      //default value
      orElse: () => ThemeFlavor.values.first,
    );
  }
}
