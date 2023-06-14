import 'package:flutter/material.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/increase_decrease_cart_quantity.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({Key? key, required this.cartModel}) : super(key: key);
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(
            height: 12.0,
          ),
          IncreaseDecreaseCartQantity(
            cartModel: cartModel,
            width: MediaQuery.of(context).size.width * 1.5 / 3,
          ),
        ],
      ),
    );
  }
}
