import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/main.dart';

void main() {
  testWidgets('Test localization title in appbar', (WidgetTester tester) async {
    final delegate = await tester.runAsync(() {
      return LocalizationDelegate.create(
          fallbackLocale: 'ar', supportedLocales: ['ar']);
    });

    await tester.pumpWidget(LocalizedApp(delegate, KortobaaApp()));
    await tester.pumpAndSettle();

    final titleFinder = find.text('Hello Kortobaa!');
    final arTitleFinder = find.text('مرحباً, قرطبة');

    expect(titleFinder, findsNothing);
    expect(arTitleFinder, findsOneWidget);
  });
}
