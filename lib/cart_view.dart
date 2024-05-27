import 'package:flutter/material.dart';
import 'package:integrationtest/model/product_model.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems = ['Apple', 'Banana'];

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var element in ProductModel.CartProductList) {
      total += element.price;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF6B9FE7),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ProductModel.CartProductList.isEmpty
                ? const Center(
                    child: Text(
                      'Cart is Empty.',
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        ProductModel.CartProductList.toSet().toList().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: Text(ProductModel.CartProductList.toSet()
                                    .toList()[index]
                                    .name)),
                            const Text(
                              'amount:',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                                ProductModel.CartProductList.where((element) =>
                                    element.name ==
                                    ProductModel.CartProductList.toSet()
                                        .toList()[index]
                                        .name).toList().length.toString(),
                                style: const TextStyle(fontSize: 14))
                          ],
                        ),
                        trailing: Text(
                          (ProductModel.CartProductList.toSet()
                                      .toList()[index]
                                      .price *
                                  ProductModel.CartProductList.where(
                                      (element) =>
                                          element.name ==
                                          ProductModel.CartProductList.toSet()
                                              .toList()[index]
                                              .name).toList().length)
                              .toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Color(0xFFFFEBAE),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              'TOTAL : $total',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B9FE7)),
              onPressed: () {
                // Simulate a successful checkout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment successful'),
                    duration: Duration(seconds: 5),
                  ),
                );
              },
              child: const Text(
                'PAYMENT',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
