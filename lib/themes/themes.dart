import 'package:flutter/material.dart';
import 'package:provider_boilerplate/helpers/ui/colors.dart';
import 'package:provider_boilerplate/helpers/ui/enums.dart';
import 'package:provider_boilerplate/helpers/ui/text_styles.dart';
import 'package:provider_boilerplate/helpers/ui/ui_helpers.dart';

// TODO: Refactor this function to handle more than two Theme Flavors
// This function takes a theme flavor and returns corresponding ThemeData object
// It works like a ThemeData 'Factory'
ThemeData getThemeData(ThemeFlavor themeFlavor) {
  // Theme Flavor Check
  // final bool isLightTheme = themeFlavor == ThemeFlavor.light;

  // ThemeData
  return ThemeData(
    // <------------------------------------------------ Main Theme Font
    fontFamily: 'Tajawal',

    // <------------------------------------------------ Colors Theme
    accentColor: kPrimaryColor,
    primaryColor: kAccentColor,
    primaryColorLight: Colors.cyan[300],
    secondaryHeaderColor: Colors.black54,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: Colors.black.withOpacity(0.10),
    hintColor: kPrimaryColor,
    disabledColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,

    // <------------------------------------------------ Primary Icon Theme
    primaryIconTheme: const IconThemeData(color: Colors.black54),

    // <------------------------------------------------ Icon Theme
    iconTheme: IconThemeData(color: kTextColor.withOpacity(0.45)),

    // <------------------------------------------------ Tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelColor: kTextColor,
      //labelStyle: ,
      unselectedLabelColor: kTextColor,
      indicator: BoxDecoration(
        color: kTextColor.withOpacity(0.1),
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
      contentPadding: EdgeInsets.symmetric(
          vertical: UiHelper.height(12), horizontal: UiHelper.width(8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
        borderSide: BorderSide(color: kTextColor.withOpacity(0.5)),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
      ),
      labelStyle: TextStyle(
        fontSize: UiHelper.size(12),
        color: kTextColor.withOpacity(0.7),
      ),
    ),

    // <------------------------------------------------ Text Theme
    textTheme: TextTheme(
      subtitle1: kSubHeaderStyle,
      headline5: kHeaderStyle,
    ),
  );
}
