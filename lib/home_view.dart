import 'package:flutter/material.dart';
import 'package:integrationtest/model/product_model.dart';

class HomePage extends StatelessWidget {
  final List<String> products = ['Apple', 'Banana', 'Orange'];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ProductModel.ProductList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ProductModel.ProductList[index].name),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ProductModel.ProductList[index].price.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      // Add product to cart
                      ProductModel.CartProductList.add(
                          ProductModel.ProductList[index]);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${ProductModel.ProductList[index].name} added to cart')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
