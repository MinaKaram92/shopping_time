import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/product_details_cubit/product_details_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/product_details_add_to_favorites.dart';

class AddProductToFavoriteOrCart extends StatelessWidget {
  const AddProductToFavoriteOrCart({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6 / 5,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const ProductDetailsAddToFavorites(),
                const SizedBox(
                  width: 16.0,
                ),
                BlocProvider.of<ProductDetailsCubit>(context)
                    .buildProductDetailsCartButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
