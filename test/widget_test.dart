import 'package:flutter_test/flutter_test.dart';
import 'package:provider_boilerplate/main.dart';

void main() {
  testWidgets('Test localization title in appbar', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    final titleFinder = find.text('Hello Kortobaa!');
    final arTitleFinder = find.text('مرحباً, قرطبة');

    expect(titleFinder, findsNothing);
    expect(arTitleFinder, findsOneWidget);
  });
}
