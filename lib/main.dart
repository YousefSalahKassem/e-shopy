import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/device/package_info/app_info_helper.dart';
import 'package:flutter_boilerplate/generated/codegen_loader.g.dart';
import 'package:flutter_boilerplate/helpers/locale.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_boilerplate/ui/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:logging/logging.dart' as log;
import 'package:shared_preferences/shared_preferences.dart';

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
  await AppSharedPreferences.ensureInitialized();

  //* EasyLocalization Initialize :---------------
  await EasyLocalization.ensureInitialized();

  // app info init
  await AppInfoHelper.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [AppLocale.arabic, AppLocale.english],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        fallbackLocale: AppLocale.english,
        useOnlyLangCode: true,
        child: const App(),
      ),
    ),
  );
}
