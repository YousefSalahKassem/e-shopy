import 'package:flutter_boilerplate/exceptions/initialization_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UninitializedException("sharedPrefsProvider"),
);
