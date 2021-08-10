import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// *** Extensions on BuildContext class *** ----------------
extension SugarExt on BuildContext {
  //* MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  //* Dimensions Extensions
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double heightR(double value) => MediaQuery.of(this).size.height * value;
  double widthR(double value) => MediaQuery.of(this).size.width * value;

  //* Device Breakpoints
  bool get isMobile => width <= 600;
  bool get isTablet => width > 600;
  bool get isDesktop => width > 950;
  bool get isLargeMobile => isMobile && height > 750;
  bool get isSmallMobile => isMobile && height < 550;

  //* Locale Extensions
  bool get isRTL =>
      intl.Bidi.isRtlLanguage(Localizations.localeOf(this).languageCode);

  //* Theme Extensions
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  void closeKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}
