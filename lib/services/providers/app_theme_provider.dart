// ignore: slash_for_doc_comments
/*******************************************************
 * Copyright (C) 2020-2021 Kortobaa LLC <license@kortobaa.com>
 * 
 * This file is part of Kortobaa E-commerce SDK.
 * 
 * Kortobaa E-commerce SDK is licensed under a Creative Commons Attribution-NoDerivatives 4.0 International License.
 * Kortobaa E-commerce SDK can not be copied and/or distributed without the express
 * permission of Kortobaa Integrated Solutions
 * Proprietary and confidential
 *******************************************************/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/services/providers/shared_preferences_provider.dart';

final appThemeProvider = ChangeNotifierProvider((ref) => AppThemeProvider());

class AppThemeProvider extends ChangeNotifier {
  //* State
  ThemeFlavor _themeFlavor;

  //* Getters
  ThemeFlavor get themeFlavor => _themeFlavor;
  bool get isDarkTheme => _themeFlavor == ThemeFlavor.dark;

  //* Constructor and Methods
  AppThemeProvider() {
    // Load Theme as soon as the provider is created
    load();
  }

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    _themeFlavor = flavor;
    SharedPreferencesProvider.instance
        .setInt(kSavedThemeIndexKey, flavor.index);
    notifyListeners();
  }

  Future<void> load() async {
    final int userFlavor =
        SharedPreferencesProvider.instance.getInt(kSavedThemeIndexKey);
    if (userFlavor == null) {
      setThemeFlavor(ThemeFlavor.light); // <----- Default Theme Flavor
    } else {
      setThemeFlavor(ThemeFlavor.values[userFlavor]);
    }
  }
}
