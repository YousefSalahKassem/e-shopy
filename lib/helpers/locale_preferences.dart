import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/helpers/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalePreferences implements ITranslatePreferences {
  @override
  Future<Locale> getPreferredLocale() async {
    final preferences = await SharedPreferences.getInstance();

    if (!preferences.containsKey(savedLocaleKey)) return null;

    final locale = preferences.getString(savedLocaleKey);

    return localeFromString(locale);
  }

  @override
  Future<void> savePreferredLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(savedLocaleKey, localeToString(locale));
  }
}
