import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class AppSharedPrefs {
  static SharedPreferences? _sharedPreferences;
  static SharedPreferences? get instance => _sharedPreferences;

  static Future<void> ensureInit() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
