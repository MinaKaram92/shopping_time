import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/cart_product_item/slide_left_background.dart';
import 'package:shopping_time/core/widgets/cart_product_item/slide_right_background.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
    required this.slideRightIcon,
    required this.slideRightText,
    required this.cartModel,
  }) : super(key: key);

  final CartModel cartModel;
  final IconData slideRightIcon;
  final String slideRightText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);

        return Dismissible(
          key: Key('${cartModel.productModel.id}'),
          background: SlideRightBackground(
              slideRightIcon: slideRightIcon, slideRightText: slideRightText),
          secondaryBackground: const SlideLeftBackground(),
          onDismissed: (direc) {
            if (direc == DismissDirection.endToStart) {
              cubit.removeProductFromCart(cartModel.productModel);
            }
            // todo move product from cart to favorites
          },
          confirmDismiss: (direc) async {
            if (direc == DismissDirection.endToStart) {
              return await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Warning'),
                    content: const Text(
                        'Are you sure you want to remove this item from cart?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Ok'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image(
                    image: NetworkImage(
                      cartModel.productModel.image!,
                    ),
                    width: 100.0,
                    height: 120.0,
                    fit: BoxFit.fill,
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
                      Container(
                        color: Colors.grey[400],
                        width: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                cubit.increaseQuantity(cartModel);
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text('${cartModel.quantity}'),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.decreaseQuantity(cartModel);
                              },
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
      },
    );
  }
}
