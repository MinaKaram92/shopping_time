import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';
import 'package:shopping_time/features/home_view_feature/data/models/product_item/rate_item.dart';

class ProductItemRateWithCart extends StatelessWidget {
  const ProductItemRateWithCart({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<CartCubit>(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                RateItem(productModel: productModel),
                const Spacer(),
                IconButton(
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    FontAwesomeIcons.cartPlus,
                    size: 20.0,
                    color: cubit.inCart
                        ? Colors.green
                        : const Color(appSecondaryColor),
                  ),
                  onPressed: () async {
                    var cartModel = CartModel(productModel: productModel);
                    await cubit.addProductToCart(cartModel);
                    cubit.isInCart(productModel);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
