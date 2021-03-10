import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider((ref) => SharedPreferencesProvider());

class SharedPreferencesProvider {
  SharedPreferences _sharedPreferences;
  SharedPreferences get sharedPreferencesInstance => _sharedPreferences;

  SharedPreferencesProvider() {
    _initSharedPreferences();
  }

  Future _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
