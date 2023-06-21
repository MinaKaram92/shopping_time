import 'package:cached_network_image/cached_network_image.dart';
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
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 1 / 4,
      height: size.height * 1 / 6,
      child: CachedNetworkImage(
        imageUrl: productModel.image!,
        fit: BoxFit.fill,
      ),
    );
  }
}
