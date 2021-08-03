import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as log;
import 'package:flutter_boilerplate/ui/app.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid && kReleaseMode) {
    final AppUpdateInfo info = await InAppUpdate.checkForUpdate();
    if (info.flexibleUpdateAllowed) {
      await InAppUpdate.performImmediateUpdate();
    }
  }
  // Log everything in debug builds.  Log warnings (and up) in release builds.
  log.Logger.root.level = kDebugMode ? log.Level.ALL : log.Level.WARNING;
  log.Logger.root.onRecord.listen((log.LogRecord rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  //* Shared Preferences Initialize :---------------
  final sharedPreferences = await SharedPreferences.getInstance();

//* EasyLocalization Initialize :---------------
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(sharedPreferences)],
      child: App(),
    ),
  );
}
