import 'package:flutter/material.dart';
import 'package:integrationtest/model/product_model.dart';

class CartView extends StatelessWidget {
  final List<String> cartItems = ['Apple', 'Banana'];

  CartView({super.key});

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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [],
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
                            Text(
                              'amount:${ProductModel.CartProductList.where((element) => element.name == ProductModel.CartProductList.toSet().toList()[index].name).toList().length.toString()}',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          (ProductModel.CartProductList.toSet()
                                          .toList()[index]
                                          .price *
                                      ProductModel.CartProductList.where(
                                          (element) =>
                                              element.name ==
                                              ProductModel.CartProductList
                                                      .toSet()
                                                  .toList()[index]
                                                  .name).toList().length)
                                  .toString() +
                              String.fromCharCode(36),
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
            width: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(4)),
            child: Text(
              'TOTAL : $total${String.fromCharCode(36)}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 60),
            child: SizedBox(
              width: 160,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B9FE7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  // Simulate a successful checkout
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Payment Successful'),
                      duration: Duration(seconds: 5),
                    ),
                  );
                },
                child: const Text(
                  'PAYMENT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
