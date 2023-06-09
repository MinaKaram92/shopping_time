import 'package:flutter/material.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/product_details_number_item.dart';

import '../../../data/models/product_item/rate_item.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            const ProductDetailsNumberItem(
                iconData: Icons.remove_red_eye, text: '1.5 k'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ProductDetailsNumberItem(
                  iconData: Icons.favorite,
                  text: '${productModel.rating!.count!}'),
            ),
            const ProductDetailsNumberItem(
                iconData: Icons.shopping_bag, text: '120'),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 1.2 / 3,
          child: Image(image: NetworkImage(productModel.image!)),
        ),
        Align(
            alignment: Alignment.topRight,
            child: RateItem(productModel: productModel)),
      ],
    );
  }
}
