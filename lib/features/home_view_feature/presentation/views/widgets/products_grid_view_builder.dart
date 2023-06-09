import 'package:flutter/material.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/home_view_feature/data/models/product_item/product_item.dart';

class ProductsGridViewBuilder extends StatelessWidget {
  const ProductsGridViewBuilder(
      {Key? key, required this.products, this.scrollPhysics})
      : super(key: key);
  final List<ProductModel> products;
  final ScrollPhysics? scrollPhysics;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        physics: scrollPhysics,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 260,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            productModel: products[index],
          );
        });
  }
}
