import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/themes/flavor/app_theme_flavor.dart';

import 'package:flutter_boilerplate/themes/flavor/dark/colors.dart';

import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';

class LightTheme implements AppThemeFlavor {
  final ThemeData _themeData = ThemeData(
// <------------------------------------------------ Main Theme Font
    fontFamily: 'Muli',

// <------------------------------------------------ Colors Theme
    errorColor: primaryColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: _appBarTheme(),
    textTheme: _textTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  @override
  // TODO: implement theme
  ThemeData get theme => _themeData;
}

InputDecorationTheme _inputDecorationTheme() {
  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme _textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).headline6,
  );
}
