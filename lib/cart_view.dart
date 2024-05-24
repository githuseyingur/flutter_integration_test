import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems = ['Apple', 'Banana'];

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index]),
                );
              },
            ),
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