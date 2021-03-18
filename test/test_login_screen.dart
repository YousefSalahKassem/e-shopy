import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/ui/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestAbleWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('should render appBar', (WidgetTester widgetTester) async {
    final LoginScreen loginScreen = LoginScreen();
    await widgetTester.pumpWidget(makeTestAbleWidget(child: loginScreen));
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('should render 2  textForm', (WidgetTester widgetTester) async {
    final LoginScreen loginScreen = LoginScreen();
    await widgetTester.pumpWidget(makeTestAbleWidget(child: loginScreen));
    expect(find.byType(TextFormField), findsNWidgets(2));
  });

  testWidgets('should render icon with semantic label',
      (WidgetTester widgetTester) async {
    final LoginScreen loginScreen = LoginScreen();
    await widgetTester.pumpWidget(makeTestAbleWidget(child: loginScreen));
    expect(find.bySemanticsLabel('login_icon'), findsOneWidget);
  });
}
