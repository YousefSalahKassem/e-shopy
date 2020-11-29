import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider_boilerplate/helpers/locale_preferences.dart';
import 'package:provider_boilerplate/routes/custom_router.dart';
import 'package:provider_boilerplate/themes/theme.dart';
import 'package:logging/logging.dart' as log;
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
  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: OverlaySupport(
        child: MaterialApp(
          title: 'Kortobaa Boilerplate',
          theme: appTheme,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          onGenerateRoute: CustomRouter.generateRoute,
          initialRoute: Routes.splashScreen,
        ),
      ),
    );
  }
}
