import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/helpers/locale_preferences.dart';
import 'package:provider_boilerplate/ui/app.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  LocalizationDelegate delegate;
  setUp(() async {
    SharedPreferences.setMockInitialValues({}); //set values here
    final SharedPreferences pref = await SharedPreferences.getInstance();

    delegate = await LocalizationDelegate.create(
        fallbackLocale: 'ar',
        supportedLocales: ['ar', 'en'],
        preferences: LocalePreferences(pref));
  });

  testWidgets('Test localization language selection screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedApp(
        delegate,
        ProviderScope(
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
  });
}
