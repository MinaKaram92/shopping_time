import 'package:flutter/material.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';

class CartFavoriteProductImage extends StatelessWidget {
  const CartFavoriteProductImage({Key? key, required this.productModel})
      : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Image(
        image: NetworkImage(
          productModel.image!,
        ),
        width: 100.0,
        height: 120.0,
        fit: BoxFit.fill,
      ),
    );
  }
}
