import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:flutter_boilerplate/ui/screens/language_selection_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SharedPreferences.setMockInitialValues({});
  EasyLocalization.logger.enableLevels = <LevelMessages>[
    LevelMessages.error,
    LevelMessages.warning,
  ];
  await EasyLocalization.ensureInitialized();
  testWidgets(
    'Test localization language selection screen',
    (WidgetTester tester) async {
      final screen = MakeTestAbleWidget(
        child: LanguageSelectionScreen(),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(screen);

        await tester.pumpAndSettle(
          const Duration(seconds: 10),
        );

        expect(find.byType(Column), findsOneWidget);
        expect(find.text('العربية'), findsOneWidget);
        expect(find.text('English'), findsOneWidget);
        expect(find.text('Start'), findsOneWidget);
        expect(find.byKey(const Key('changeAr')), findsOneWidget);

        await tester.tap(find.byKey(const Key('changeAr')));
        await tester.pumpAndSettle();

        // check text in screen after change language into arabic
        expect(find.text('ابدأ'), findsOneWidget);

        // expect is true after tap change language to arabic
        expect(tr('start'), 'ابدأ');
      });
    },
  );
}

class MakeTestAbleWidget extends StatelessWidget {
  final Widget? child;

  const MakeTestAbleWidget({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        startLocale: const Locale('en'),
        child: Builder(builder: (ctx) {
          return OverlaySupport(
            child: MaterialApp(
              localizationsDelegates: ctx.localizationDelegates,
              supportedLocales: ctx.supportedLocales,
              locale: ctx.locale,
              builder: (context, navigator) {
                // Update Screen Dimensions
                UiHelper.updateScreenDimensions(context);

                return AppTheme(navigator: navigator);
              },
              home: child,
            ),
          );
        }),
      ),
    );
  }
}
