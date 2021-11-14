import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appThemeProvider = ChangeNotifierProvider(
  (ref) => AppThemeProvider(ref.watch(sharedPrefsProvider)),
);

class AppThemeProvider extends ChangeNotifier {
  //* Dependency
  late final SharedPreferences? _sharedPreferences;
  //* State
  ThemeFlavor? _themeFlavor;

  //* Getters
  ThemeFlavor? get themeFlavor => _themeFlavor;
  bool get isDarkTheme => _themeFlavor == ThemeFlavor.dark;

  //* Constructor and Methods

  // this test
  AppThemeProvider(this._sharedPreferences) {
    // Load Theme as soon as the provider is created
    load();
  }

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    _themeFlavor = flavor;
    _sharedPreferences!.setInt(kSavedThemeIndexKey, flavor.index);
    notifyListeners();
  }

  Future<void> load() async {
    final int? userFlavor = _sharedPreferences!.getInt(kSavedThemeIndexKey);
    if (userFlavor == null) {
      setThemeFlavor(ThemeFlavor.light); // <----- Default Theme Flavor
    } else {
      setThemeFlavor(ThemeFlavor.values[userFlavor]);
    }
  }
}
