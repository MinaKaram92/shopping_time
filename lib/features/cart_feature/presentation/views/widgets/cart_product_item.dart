import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/widgets/slide_left_background.dart';
import 'package:shopping_time/core/widgets/slide_right_background.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/widgets/cart_product_item_details.dart';
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
        return Dismissible(
          key: Key('${cartModel.productModel.id}'),
          secondaryBackground: const SlideLeftBackground(),
          background: const SlideRightBackground(
            slideRightIcon: Icons.favorite,
            slideRightText: 'Move To Favorite',
          ),
          onDismissed: (direc) {
            onDismissedCartItem(context, direc);
          },
          confirmDismiss: (direc) async {
            return await confirmDismiss(context, direc);
          },
          child: CartProductItemDetails(cartModel: cartModel),
        );
      },
    );
  }

  void onDismissedCartItem(BuildContext context, DismissDirection direc) {
    if (direc == DismissDirection.endToStart) {
      BlocProvider.of<CartCubit>(context)
          .removeProductFromCart(cartModel.productModel);
    } else if (direc == DismissDirection.startToEnd) {
      BlocProvider.of<CartCubit>(context)
          .removeProductFromCart(cartModel.productModel);
      BlocProvider.of<FavoriteCubit>(context)
          .addToFavorites(cartModel.productModel);
    }
  }

  Future<bool?> confirmDismiss(
      BuildContext context, DismissDirection direc) async {
    if (direc == DismissDirection.endToStart) {
      return await showDialog(
        context: context,
        builder: (context) {
          return showAlertDialog(context,
              content: 'Are you sure you want to remove this item from cart?',
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
            content: 'Are you sure you want to move this item to favorites?',
            okPressed: () {
              Navigator.of(context).pop(true);
            },
          );
        },
      );
    }
    return null;
  }
}
