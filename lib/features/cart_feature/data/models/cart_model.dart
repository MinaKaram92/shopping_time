import 'package:shopping_time/core/models/product_model/product_model.dart';

class CartModel {
  final ProductModel productModel;
  final int quantity;

  CartModel({
    required this.productModel,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        productModel: ProductModel.fromJson(json['productModel']),
        quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'productModel': productModel.toJson(), 'quantity': quantity};
  }

  @override
  String toString() {
    return 'quantity= $quantity';
  }
}
