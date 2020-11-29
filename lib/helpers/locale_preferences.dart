import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/helpers/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalePreferences implements ITranslatePreferences {
  final SharedPreferences _preferences;

  LocalePreferences(SharedPreferences preferences) : _preferences = preferences;
  @override
  Future<Locale> getPreferredLocale() async {
    if (!_preferences.containsKey(savedLocaleKey)) return null;

    final locale = _preferences.getString(savedLocaleKey);

    return localeFromString(locale);
  }

  @override
  Future<void> savePreferredLocale(Locale locale) async {
    await _preferences.setString(savedLocaleKey, localeToString(locale));
  }
}
