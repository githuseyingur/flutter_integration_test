import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:integrationtest/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('END TO END', () {
    //group: organizes related tests together for better structure and readability.
    testWidgets('Full App Test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('LOG IN'), findsWidgets);
      // Giriş yapma ekranında kullanıcı adını ve şifreyi gir
      await tester.enterText(find.byType(TextField).at(0), 'user');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'Pass1234');
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Username cannot be smaller than 8 characters!'),
          findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.text('Username cannot be smaller than 8 characters!'),
          findsNothing);
      debugPrint('Test 1 Passed : Log in (Username Validation Error Message)');

      // Giriş yapma ekranında kullanıcı adını ve şifreyi gir
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'Password');
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(
          find.text(
              'Password must contain min 8 chars, at least one letter and one number.'),
          findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(
          find.text(
              'Password must contain min 8 chars, at least one letter and one number.'),
          findsNothing);
      debugPrint('Test 2 Passed : Log in (Password Validation Error Message)');

      // Giriş yapma ekranında kullanıcı adını ve şifreyi gir
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'Pass12345');
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsNothing);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsNothing);
      debugPrint('Test 3 Passed : Log in (Wrong Password or Username)');

      await tester.enterText(find.byType(TextField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'Pass1234');
      await Future.delayed(const Duration(seconds: 3));
      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      // Anasayfada ürünleri ekrana getir
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Orange'), findsOneWidget);
      debugPrint('Test 4 Passed : Log in Successful');
      // Bir ürünü sepete ekle
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).first);
      await tester.pumpAndSettle();
      expect(find.text('Apple added to cart'), findsOneWidget);
      debugPrint('Test 2 Passed : Add to Cart Snackbar');
      // Sepet sayfasına git
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      // Sepet sayfasında ürünlerin olduğunu kontrol et
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);

      // Checkout butonuna tıkla
      // await tester.tap(find.b);
      // await tester.pumpAndSettle();

      // // Snackbar'ın çıktığını kontrol edin
      // expect(find.text('Checkout successful'), findsOneWidget);
    });
  });
}
