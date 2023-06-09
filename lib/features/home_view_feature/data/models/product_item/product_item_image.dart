import 'package:flutter/material.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.0,
      left: 35.0,
      child: Image.network(productModel.image!,
          width: 80, height: 90, fit: BoxFit.fill),
    );
  }
}
