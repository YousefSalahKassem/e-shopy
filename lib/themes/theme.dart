import 'package:flutter/material.dart';
import 'package:kortobaa_flutter_provider_boilerplate/helpers/ui/app_colors.dart';
import 'package:kortobaa_flutter_provider_boilerplate/helpers/ui/text_styles.dart';

// TODO: Add theme data depending on design
final ThemeData appTheme = ThemeData(
  fontFamily: 'cairo',
  accentColor: primaryColor,
  primaryColor: accentColor,
  primaryColorLight: Colors.cyan[300],
  secondaryHeaderColor: Colors.black54,
  backgroundColor: Colors.white,
  cardColor: Colors.white,
  bottomAppBarColor: Colors.white,
  dividerColor: Colors.black.withOpacity(0.10),
  hintColor: primaryColor,
  disabledColor: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(color: textColor.withOpacity(0.45)),
  tabBarTheme: TabBarTheme(
    labelColor: textColor,
    //labelStyle: ,
    unselectedLabelColor: textColor,
    indicator: BoxDecoration(
      color: textColor.withOpacity(0.1),
    ),
  ),
  primaryIconTheme: IconThemeData(color: Colors.black54),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      gapPadding: 0,
      borderSide: BorderSide(color: textColor.withOpacity(0.5), width: 1),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      gapPadding: 0,
    ),
    labelStyle: TextStyle(
      fontSize: 12,
      color: textColor.withOpacity(0.7),
    ),
  ),
  textTheme: TextTheme(
    subhead: subHeaderStyle,
    headline: headerStyle,
  ),
);
