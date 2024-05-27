import 'package:flutter/material.dart';
import 'package:integrationtest/cart_view.dart';
import 'package:integrationtest/model/product_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF6B9FE7),
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: const Color(0xFFFFEBAE),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartView(),
                      ));
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(
                  '${ProductModel.CartProductList.length}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ProductModel.ProductList.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 12),
            title: Text(ProductModel.ProductList[index].name),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ProductModel.ProductList[index].price.toString() +
                        String.fromCharCode(36),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color.fromARGB(255, 80, 99, 127),
                    ),
                    onPressed: () {
                      // Add product to cart
                      setState(() {
                        ProductModel.CartProductList.add(
                            ProductModel.ProductList[index]);
                      });

                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${ProductModel.ProductList[index].name} added to cart'),
                          duration: const Duration(seconds: 3),
                        ),
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
