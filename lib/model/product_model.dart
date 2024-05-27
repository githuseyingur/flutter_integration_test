// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String name;
  double price;

  ProductModel({
    required this.name,
    required this.price,
  });

  static final List<ProductModel> ProductList = [
    ProductModel(name: 'Laptop', price: 1152.00),
    ProductModel(name: 'Monitor', price: 184.00),
    ProductModel(name: 'Table', price: 38.00),
    ProductModel(name: 'Chair', price: 24.00),
    ProductModel(name: 'Mouse', price: 16.00),
    ProductModel(name: 'Earphone', price: 14.00),
  ];
  static List<ProductModel> CartProductList = [];
}
