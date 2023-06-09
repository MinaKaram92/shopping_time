import 'package:flutter/material.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/cart_product_item/slide_left_background.dart';
import 'package:shopping_time/core/widgets/cart_product_item/slide_right_background.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('id'),
      background: SlideRightBackground(iconData: iconData, text: text),
      secondaryBackground: const SlideLeftBackground(),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image(
                image: NetworkImage(
                  productModel.image!,
                ),
                width: 100.0,
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    productModel.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      r'$' '${productModel.price!}',
                      style: AppTextStyles.textStyle18Reg,
                    ),
                  ),
                  Container(
                    color: Colors.grey[400],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('2'),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
