import 'package:flutter/material.dart';
import 'package:integrationtest/model/product_model.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems = ['Apple', 'Banana'];

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ProductModel.CartProductList.toSet().toList().length,
              itemBuilder: (context, index) {
                
                double total = 0;
                for (var element in ProductModel.CartProductList) {
                  total+=element.price;
                  
                }
                return ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                          width: screenWidth * 0.3,
                          child: Text(
                              '${ProductModel.CartProductList[index].name}')),
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
                                  ProductModel.CartProductList[index].name)
                              .toList()
                              .length
                              .toString(),
                          style: const TextStyle(fontSize: 14))
                    ],
                  ),
                  trailing: Text(
                    (ProductModel.CartProductList[index].price *
                            ProductModel.CartProductList.where((element) =>
                                    element.name ==
                                    ProductModel.CartProductList[index].name)
                                .toList()
                                .length)
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
          Text(
            'TOTAL : ${}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Simulate a successful checkout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Checkout successful'),
                    duration: Duration(seconds: 5),
                  ),
                );
              },
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
