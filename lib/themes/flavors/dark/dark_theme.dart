import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/themes/flavors/app_theme_flavor.dart';
import 'package:flutter_boilerplate/themes/flavors/light/colors.dart';
import 'package:flutter_boilerplate/themes/text_styles.dart' as text_styles;

class DarkTheme implements AppThemeFlavor {
  final ThemeData _themeData = ThemeData(
// <------------------------------------------------ Main Theme Font
    fontFamily: 'Tajawal',

// <------------------------------------------------ Colors Theme
    errorColor: primaryColor,
    primaryColor: primaryColor,
    primaryColorLight: Colors.cyan[300],
    secondaryHeaderColor: Colors.black54,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: Colors.black.withOpacity(0.10),
    hintColor: primaryColor,
    disabledColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,

// <------------------------------------------------ Primary Icon Theme
    primaryIconTheme: const IconThemeData(color: Colors.black54),

// <------------------------------------------------ Icon Theme
    iconTheme: IconThemeData(color: textColor.withOpacity(0.45)),

// <------------------------------------------------ Tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelColor: textColor,
//labelStyle: ,
      unselectedLabelColor: textColor,
      indicator: BoxDecoration(
        color: textColor.withOpacity(0.1),
      ),
    ),

// <------------------------------------------------ FAB Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),

// <------------------------------------------------ App Bar Theme Theme
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),

// <------------------------------------------------ Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: spaceLarge,
        horizontal: spaceSmall,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
        borderSide: BorderSide(color: textColor.withOpacity(0.5)),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
      ),
      labelStyle: TextStyle(
        fontSize: spaceMedium,
        color: textColor.withOpacity(0.7),
      ),
    ),

// <------------------------------------------------ Text Theme
    textTheme: const TextTheme(
      subtitle1: text_styles.subHeaderStyle,
      headline5: text_styles.headerStyle,
    ),
  );

  @override
  ThemeData get theme => _themeData;
}
