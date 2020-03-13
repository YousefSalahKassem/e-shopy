import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/themes/theme.dart';
import 'package:provider_boilerplate/routes/router.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ar', supportedLocales: ['ar', 'en']);
  runApp(LocalizedApp(delegate, KortobaaApp()));
}

class KortobaaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
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
        onGenerateRoute: Router.onGenerateRoute,
        navigatorKey: Router.navigator.key,
        initialRoute: Router.homeScreen,
      ),
    );
  }
}
