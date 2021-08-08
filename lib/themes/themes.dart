import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/themes/colors.dart' as colors;
import 'package:flutter_boilerplate/themes/text_styles.dart' as text_styles;

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
    accentColor: colors.kPrimaryColor,
    primaryColor: colors.kAccentColor,
    primaryColorLight: Colors.cyan[300],
    secondaryHeaderColor: Colors.black54,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: Colors.black.withOpacity(0.10),
    hintColor: colors.kPrimaryColor,
    disabledColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,

    // <------------------------------------------------ Primary Icon Theme
    primaryIconTheme: const IconThemeData(color: Colors.black54),

    // <------------------------------------------------ Icon Theme
    iconTheme: IconThemeData(color: colors.kTextColor.withOpacity(0.45)),

    // <------------------------------------------------ Tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelColor: colors.kTextColor,
      //labelStyle: ,
      unselectedLabelColor: colors.kTextColor,
      indicator: BoxDecoration(
        color: colors.kTextColor.withOpacity(0.1),
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
          vertical: kSpaceLarge, horizontal: kSpaceSmall),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
        borderSide: BorderSide(color: colors.kTextColor.withOpacity(0.5)),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
      ),
      labelStyle: TextStyle(
        fontSize: kSpaceMedium,
        color: colors.kTextColor.withOpacity(0.7),
      ),
    ),

    // <------------------------------------------------ Text Theme
    textTheme: const TextTheme(
      subtitle1: text_styles.kSubHeaderStyle,
      headline5: text_styles.kHeaderStyle,
    ),
  );
}
