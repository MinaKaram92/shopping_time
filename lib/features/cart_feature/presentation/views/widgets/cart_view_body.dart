import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_time/core/widgets/cart_product_item/cart_product_item.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);
        return ListView.separated(
            itemBuilder: (context, index) {
              return CartProductItem(
                iconData: FontAwesomeIcons.cartPlus,
                text: 'Add To Cart',
                productModel: cubit.userCart[index].productModel,
              );
            },
            separatorBuilder: (context, inde) => const SizedBox(
                  height: 16.0,
                ),
            itemCount: cubit.userCart.length);
      },
    );
  }
}
