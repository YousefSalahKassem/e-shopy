import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';

import 'package:flutter_boilerplate/themes/flavors/dark/dark_theme.dart';
import 'package:flutter_boilerplate/themes/flavors/light/light_theme.dart';

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
