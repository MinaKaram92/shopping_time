import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';

class ProductItemDetails extends StatelessWidget {
  const ProductItemDetails({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 14.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                productModel.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Text(r'$' '${productModel.price}'),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite,
                        color: Color(appSecondaryColor)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
