# Flutter Integration Test
<img src="https://github.com/githuseyingur/flutter_integration_test/assets/120099096/05bd400a-3b6d-4d67-af0c-2b052e748651"  width="280" height ="560">
<img src="https://github.com/githuseyingur/flutter_integration_test/assets/120099096/66ddfc7c-14e0-4a7e-bfa2-38056e846c94"  width="280" height ="560">
<img src="https://github.com/githuseyingur/flutter_integration_test/assets/120099096/260758f6-5e44-4b27-8fc8-8810b15e36f4"  width="280" height ="560">
```Dart
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
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('cannot be smaller than 8 characters!'), findsOneWidget);
      expect(
          find.text(
              'minimum 8 characters, at least one letter and one number.'),
          findsNothing);

      debugPrint('Test 1 Passed! : Username Validation Error');

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

      debugPrint('Test 2 Passed! : Password Validation Error');

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
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.text('Invalid username or password'), findsNothing);
      debugPrint('Test 3 Passed! : Wrong Password or Username');

      // TEST-4: Successful Login
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'pass1234');
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Home Page
      expect(find.text('Laptop'), findsOneWidget);
      expect(find.text('1152.0${String.fromCharCode(36)}'), findsOneWidget);
      expect(find.text('Table'), findsOneWidget);
      expect(find.text('Earphone'), findsOneWidget);
      debugPrint('Test 4 Passed! : Login with username & pass1234');
      debugPrint('LOGIN - All Tests Passed!\n');
      debugPrint('Successfully open Home Page\n');

      // CART TEST
      debugPrint('CART TEST');
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      expect(find.text('Cart is Empty.'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      // TEST-1 : Add to Cart
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add_circle).at(0));
      await tester.pumpAndSettle();
      expect(find.text('Laptop added to cart'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add_circle).at(0));
      await tester.pumpAndSettle();
      expect(find.text('Laptop added to cart'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add_circle).at(1));
      await tester.pumpAndSettle();
      expect(find.text('Monitor added to cart'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add_circle).at(2));
      await tester.pumpAndSettle();
      expect(find.text('Table added to cart'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add_circle).at(4));
      await tester.pumpAndSettle();
      expect(find.text('Mouse added to cart'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      debugPrint('Test 1 Passed! : Add To Cart');

      // TEST-2 : SHOW CART
      await Future.delayed(const Duration(seconds: 5));

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      expect(find.text('Cart'), findsOneWidget);

      expect(find.text('Laptop'), findsOneWidget);
      expect(find.text('amount:2'), findsOneWidget);
      expect(find.text('amount:1'), findsWidgets);
      expect(find.text('2304.0${String.fromCharCode(36)}'), findsOneWidget);
      expect(find.text('Monitor'), findsOneWidget);
      expect(find.text('Table'), findsOneWidget);
      expect(find.text('Mouse'), findsOneWidget);

      expect(find.text('TOTAL : 2542.0${String.fromCharCode(36)}'),
          findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      // Snackbar'ın çıktığını kontrol edin
      expect(find.text('Payment Successful'), findsOneWidget);
      debugPrint('Test 2 Passed! : Cart Informations');
      debugPrint('CART - All Tests Passed!');
    });
  });
}
```




