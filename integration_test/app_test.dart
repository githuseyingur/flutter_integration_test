import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:integrationtest/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('APP TEST:', () {
    // group: organizes related tests together for better structure and readability.
    testWidgets('Full App Test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // LOGIN TEST
      debugPrint('LOGIN TEST');
      expect(find.text('LOG IN'), findsWidgets);
      // TEST-1 : Username validation error
      await tester.enterText(find.byType(TextField).at(0), 'user');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'pass1234');
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('cannot be smaller than 8 characters!'), findsOneWidget);
      expect(
          find.text(
              'minimum 8 characters, at least one letter and one number.'),
          findsNothing);

      debugPrint('Test 1 Passed : Log in (Username Validation Error Message)');
      // TEST-2 : Password Validation Error
      await tester.enterText(find.byType(TextField).at(0), '');
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), '');
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(1), 'password');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(
          find.text(
              'minimum 8 characters, at least one letter and one number.'),
          findsOneWidget);
      expect(find.text('cannot be smaller than 8 characters!'), findsNothing);

      debugPrint('Test 2 Passed : Log in (Password Validation Error Message)');
      // TEST-3 : Invalid Username or Password
      await tester.enterText(find.byType(TextField).at(0), '');
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), '');
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(1), 'pass12345');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsNothing);
      debugPrint('Test 3 Passed : Log in (Wrong Password or Username)');
      // TEST-4: Successful Login
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'pass1234');
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      // Anasayfada ürünleri ekrana getir
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Orange'), findsOneWidget);
      debugPrint('Test 4 Passed : Successful Login');
      // CART TEST
      debugPrint('CART TEST');
      // TEST-1 : Add to Cart
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).first);
      await tester.pumpAndSettle();
      expect(find.text('Apple added to cart'), findsOneWidget);
      debugPrint('Test 1 Passed : Add to Cart Snackbar');
      // TEST-2 : SHOW CART
      await Future.delayed(const Duration(seconds: 5));

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      debugPrint('Test 2 Passed : Products in Cart');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      // Snackbar'ın çıktığını kontrol edin
      expect(find.text('Checkout successful'), findsOneWidget);
    });
  });
}
