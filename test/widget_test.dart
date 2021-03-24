import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.dart';
import 'package:flutter_boilerplate/services/providers/app_shared_prefs.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:flutter_boilerplate/ui/screens/language_selection_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await AppSharedPrefs.ensureInit();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  testWidgets(
    'Test localization language selection screen',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MakeTestAbleWidget(
          child: LanguageSelectionScreen(),
        ));

        await tester.pump();
        expect(find.byType(Column), findsOneWidget);
      });
    },
  );
}

class MakeTestAbleWidget extends StatelessWidget {
  final Widget child;

  const MakeTestAbleWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: OverlaySupport(
          child: MaterialApp(
            locale: const Locale('ar'),
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            onGenerateRoute: CustomRouter.generateRoute,
            initialRoute: Routes.splashScreen,
            builder: (context, navigator) {
              // Update Screen Dimensions
              UiHelper.updateScreenDimensions(context);

              return AppTheme(navigator: navigator);
            },
            home: child,
          ),
        ),
      ),
    );
  }
}
