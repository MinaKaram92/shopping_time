import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/widgets/no_items.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/widgets/cart_product_item.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is FailureGetCartState) {
          showSnack(context, SnackStatus.fail, state.errorMessage);
        } else if (state is LoadingCartState) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<CartCubit>(context);
        if (cubit.userCart.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return CartProductItem(
                cartModel: cubit.userCart[index],
              );
            },
            separatorBuilder: (context, inde) => const SizedBox(
              height: 16.0,
            ),
            itemCount: cubit.userCart.length,
          );
        } else {
          return const NoItems(
            image: 'assets/images/no_cart.png',
            title: 'Cart Is Empty.',
          );
        }
      },
    );
  }
}
