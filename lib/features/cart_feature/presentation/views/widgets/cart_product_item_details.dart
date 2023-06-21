import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/increase_decrease_cart_quantity.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';

class CartProductItemDetails extends StatelessWidget {
  const CartProductItemDetails({Key? key, required this.cartModel})
      : super(key: key);
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 1.2 / 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CachedNetworkImage(
              imageUrl: cartModel.productModel.image!,
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 45.0,
                  child: Text(
                    cartModel.productModel.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  r'$' '${cartModel.productModel.price!}',
                  style: AppTextStyles.textStyle18Reg,
                ),
                IncreaseDecreaseCartQantity(
                  cartModel: cartModel,
                  width: size.width * 1.4 / 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
