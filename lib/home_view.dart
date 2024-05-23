import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> products = ['Apple', 'Banana', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Add product to cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${products[index]} added to cart')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
