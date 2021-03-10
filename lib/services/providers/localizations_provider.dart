import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kDefaultLocale = Locale('ar');

final localizationsProvider =
    ChangeNotifierProvider((ref) => LocalizationsProvider());

class LocalizationsProvider with ChangeNotifier {
  Locale _locale;
  Locale get locale => _locale;
  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();

    if (!preferences.containsKey(kSavedLocaleKey)) {
      _locale = kDefaultLocale;
    } else {
      final locale = preferences.getString(kSavedLocaleKey);

      _locale = Locale(locale);
    }
  }

  Future<void> savePreferredLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(kSavedLocaleKey, locale.languageCode);
  }

  Future<void> changeLocale(Locale passedLocale) async {
    _locale = passedLocale;
    await savePreferredLocale(passedLocale);
    notifyListeners();
  }
}
