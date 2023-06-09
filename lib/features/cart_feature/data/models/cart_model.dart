import 'package:shopping_time/core/models/product_model/product_model.dart';

class CartModel {
  late String id;
  final ProductModel productModel;
  final int quantity;

  CartModel({
    required this.productModel,
    this.quantity = 1,
  }) : id = generateID();

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        productModel: ProductModel.fromJson(json['productModel']),
        quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'productModel': productModel.toJson(), 'quantity': quantity};
  }

  static String generateID() {
    var now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
