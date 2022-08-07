import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin AppSharedPreferences {
  static late final SharedPreferences _shearedPreferences;
  static final provider =
      Provider<SharedPreferences>((ref) => _shearedPreferences);

  static Future<void> ensureInitialized() async {
    _shearedPreferences = await SharedPreferences.getInstance();
  }
}
