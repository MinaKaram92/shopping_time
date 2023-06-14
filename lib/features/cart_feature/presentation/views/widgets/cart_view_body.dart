import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/widgets/cart_product_item.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);
        return ConditionalBuilder(
          condition: cubit.userCart.isNotEmpty,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) {
              return CartProductItem(
                cartModel: cubit.userCart[index],
              );
            },
            separatorBuilder: (context, inde) => const SizedBox(
              height: 16.0,
            ),
            itemCount: cubit.userCart.length,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
