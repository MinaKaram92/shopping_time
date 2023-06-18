import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/cart_favorite_product_image.dart';
import 'package:shopping_time/core/widgets/slide_left_background.dart';
import 'package:shopping_time/core/widgets/increase_decrease_cart_quantity.dart';
import 'package:shopping_time/core/widgets/slide_right_background.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/widgets/cart_item_datails.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);
        return Dismissible(
          key: Key('${cartModel.productModel.id}'),
          secondaryBackground: const SlideLeftBackground(),
          background: const SlideRightBackground(
            slideRightIcon: Icons.favorite,
            slideRightText: 'Move To Favorite',
          ),
          onDismissed: (direc) {
            if (direc == DismissDirection.endToStart) {
              cubit.removeProductFromCart(cartModel.productModel);
            } else if (direc == DismissDirection.startToEnd) {
              cubit.removeProductFromCart(cartModel.productModel);
              BlocProvider.of<FavoriteCubit>(context)
                  .addToFavorites(cartModel.productModel);
            }
          },
          confirmDismiss: (direc) async {
            if (direc == DismissDirection.endToStart) {
              return await showDialog(
                context: context,
                builder: (context) {
                  return showAlertDialog(context,
                      content:
                          'Are you sure you want to remove this item from cart?',
                      okPressed: () {
                    Navigator.of(context).pop(true);
                  });
                },
              );
            } else if (direc == DismissDirection.startToEnd) {
              return await showDialog(
                context: context,
                builder: (context) {
                  return showAlertDialog(
                    context,
                    content:
                        'Are you sure you want to move this item to favorites?',
                    okPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  );
                },
              );
            }
          },
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 1.2 / 5,
            child: Row(
              children: [
                CartFavoriteProductImage(productModel: cartModel.productModel),
                const SizedBox(
                  width: 24.0,
                ),
                CartItemDetails(cartModel: cartModel),
              ],
            ),
          ),
        );
      },
    );
  }
}
