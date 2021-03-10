import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/all.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:in_app_update/in_app_update.dart';

import 'package:provider_boilerplate/helpers/locale_preferences.dart';

import 'package:logging/logging.dart' as log;
import 'package:provider_boilerplate/ui/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid && kReleaseMode) {
    final AppUpdateInfo info = await InAppUpdate.checkForUpdate();
    if (info.updateAvailable) {
      await InAppUpdate.performImmediateUpdate();
    }
  }
  // Log everything in debug builds.  Log warnings (and up) in release builds.
  log.Logger.root.level = kDebugMode ? log.Level.ALL : log.Level.WARNING;
  log.Logger.root.onRecord.listen((log.LogRecord rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  // Shared Preference
  final sharedPreferences = await SharedPreferences.getInstance();

  final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ar',
      supportedLocales: ['ar', 'en'],
      preferences: LocalePreferences(sharedPreferences));
  runApp(
    ProviderScope(
      child: LocalizedApp(
        delegate,
        App(),
      ),
    ),
  );
}
