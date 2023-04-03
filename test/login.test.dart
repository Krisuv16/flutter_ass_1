import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patientapp/auth/login.dart';

void main() {
  group('LoginPage', () {
    late LoginPage loginPage;

    setUp(() {
      loginPage = LoginPage();
    });

    testWidgets('renders UI correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: loginPage));
      expect(find.image(const AssetImage("assets/images/logo.png")),
          findsOneWidget);
      expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
      expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
