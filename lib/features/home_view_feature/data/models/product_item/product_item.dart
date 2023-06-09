import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/features/home_view_feature/data/models/product_item/product_item_details.dart';
import 'package:shopping_time/features/home_view_feature/data/models/product_item/product_item_image.dart';
import 'package:shopping_time/features/home_view_feature/data/models/product_item/product_item_rate_with_cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kProductDetailsView, extra: productModel);
      },
      child: Column(
        children: [
          SizedBox(
            width: size.width * .9 / 2,
            height: size.height * 1.2 / 3,
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductItemRateWithCart(productModel: productModel),
                      const Spacer(),
                      ProductItemDetails(productModel: productModel),
                    ],
                  ),
                  ProductItemImage(productModel: productModel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
