import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integrationtest/main.dart';

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app test', (WidgetTester tester) async {
    // Uygulamayı başlat
    await tester.pumpWidget(MyApp());

    // Giriş yapma ekranında kullanıcı adını ve şifreyi gir
    await tester.enterText(find.byType(TextField).at(0), 'user');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Giriş butonuna tıkla
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Anasayfada ürünleri ekrana getir
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('Orange'), findsOneWidget);

    // Bir ürünü sepete ekle
    await tester.tap(find.widgetWithIcon(IconButton, Icons.add).first);
    await tester.pumpAndSettle();
    expect(find.text('Apple added to cart'), findsOneWidget);

    // Sepet sayfasına git
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    // Sepet sayfasında ürünlerin olduğunu kontrol et
    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);

    // Checkout butonuna tıkla
    // await tester.tap(find.byType(ElevatedButton));
    // await tester.pumpAndSettle();

    // // Başarılı ödeme mesajını kontrol et
    // expect(find.text('Checkout successful'), findsOneWidget);
  });
}
