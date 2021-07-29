import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/services/providers/app_shared_prefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';

final appThemeProvider = ChangeNotifierProvider((ref) => AppThemeProvider());

class AppThemeProvider extends ChangeNotifier {
  //* State
  ThemeFlavor? _themeFlavor;

  //* Getters
  ThemeFlavor? get themeFlavor => _themeFlavor;
  bool get isDarkTheme => _themeFlavor == ThemeFlavor.dark;

  //* Constructor and Methods

  // this test
  AppThemeProvider() {
    // Load Theme as soon as the provider is created
    load();
  }

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    _themeFlavor = flavor;
    AppSharedPrefs.instance!.setInt(kSavedThemeIndexKey, flavor.index);
    notifyListeners();
  }

  Future<void> load() async {
    final int? userFlavor =
        AppSharedPrefs.instance!.getInt(kSavedThemeIndexKey);
    if (userFlavor == null) {
      setThemeFlavor(ThemeFlavor.light); // <----- Default Theme Flavor
    } else {
      setThemeFlavor(ThemeFlavor.values[userFlavor]);
    }
  }
}
