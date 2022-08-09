import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/themes/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/flavors/dark/dark_theme.dart';
import 'package:flutter_boilerplate/themes/flavors/light/light_theme.dart';

/// ### Used to generate theme flavors for the app from [ThemeFlavor]
///
/// you can make your Theme flavor by :
/// 1- Inheritance from [AppThemeFlavor] and add your custom theme in [theme],
/// Note: use flavors folder for the new flavor,see [LightTheme].
/// 2- add Theme flavor name to [ThemeFlavor].
/// to control the current theme see [AppTheme]
abstract class AppThemeFlavor {
  ThemeData get theme;

  factory AppThemeFlavor.fromFlavor(ThemeFlavor themeFlavor) {
    switch (themeFlavor) {
      case ThemeFlavor.light:
        return LightTheme();
      case ThemeFlavor.dark:
        return DarkTheme();
    }
  }
}
