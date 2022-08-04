import 'package:flutter/cupertino.dart';

mixin AppLocale {
  static const Locale arabic = Locale('ar', 'EG');
  static const Locale english = Locale('en', 'US');
  static const List<Locale> locales = [arabic, english];
}
