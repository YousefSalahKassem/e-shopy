import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';
import 'package:provider_boilerplate/helpers/localizations_provider.dart';
import 'package:provider_boilerplate/routes/router.dart';
import 'package:provider_boilerplate/themes/theme.dart';
import 'package:logging/logging.dart' as log;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final localizationsProvider = LocalizationsProvider();
  await localizationsProvider.init();

  runApp(ChangeNotifierProvider(
      create: (_) => localizationsProvider, builder: (_, __) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kortobaa Boilerplate',
      theme: appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<LocalizationsProvider>().locale,
      onGenerateRoute: CustomRouter.generateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
