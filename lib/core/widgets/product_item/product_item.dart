import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/widgets/product_item/product_item_details.dart';
import 'package:shopping_time/core/widgets/product_item/product_item_image.dart';
import 'package:shopping_time/core/widgets/product_item/product_item_rate_with_cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kProductDetailsView, extra: productModel);
      },
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductItemRateWithCart(productModel: productModel),
            ProductItemImage(productModel: productModel),
            ProductItemDetails(productModel: productModel),
          ],
        ),
      ),
    );
  }
}
