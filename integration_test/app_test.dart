import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:integrationtest/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //group: organizes related tests together for better structure and readability.
  group('END TO END', () {
    testWidgets('Full APP TEST', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('LOG IN'), findsWidgets);
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsNothing);
      debugPrint('Test 1 Passed : Log in Error Message');

      // Giriş yapma ekranında kullanıcı adını ve şifreyi gir
      await tester.enterText(find.byType(TextField).at(0), 'user');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'password');
      await Future.delayed(const Duration(seconds: 3));

      // Giriş butonuna tıkla
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Anasayfada ürünleri ekrana getir
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Orange'), findsOneWidget);
      debugPrint('Test 2 Passed : Log in');
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

      // // Checkout butonuna tıkla
      // await tester.tap(find.byType(ElevatedButton));
      // await tester.pumpAndSettle();

      // // Snackbar'ın çıktığını kontrol edin
      // expect(find.text('Checkout successful'), findsOneWidget);
    });
  });
}
