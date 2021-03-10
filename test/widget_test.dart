import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider_boilerplate/ui/app.dart';

void main() {
  setUp(
    () async {
      testWidgets(
        'Test localization language selection screen',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            EasyLocalization(
              supportedLocales: const [Locale('en'), Locale('ar')],
              path: 'assets/translations',
              fallbackLocale: const Locale('en'),
              child: ProviderScope(
                child: App(),
              ),
            ),
          );
          await tester.pumpAndSettle(const Duration(seconds: 7));

          final englishFinder = find.text('English');
          final arabicFinder = find.text('العربية');
          final startEnFinder = find.text('Start');
          final startArFinder = find.text('ابدأ');
          final titleFinder = find.text('Hello, Kortobaa!');
          final homeScreenTextFinder = find.text('Home screen');
          expect(englishFinder, findsOneWidget);
          expect(arabicFinder, findsOneWidget);
          expect(startArFinder, findsOneWidget);
          expect(startEnFinder, findsNothing);
          await tester.tap(englishFinder);
          await tester.pumpAndSettle();
          expect(startArFinder, findsNothing);
          expect(startEnFinder, findsOneWidget);
          await tester.tap(startEnFinder);
          await tester.pumpAndSettle();
          expect(titleFinder, findsOneWidget);
          expect(homeScreenTextFinder, findsOneWidget);
        },
      );
    },
  );
}
