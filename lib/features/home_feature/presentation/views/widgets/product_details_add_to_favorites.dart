import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_states.dart';

class ProductDetailsAddToFavorites extends StatelessWidget {
  const ProductDetailsAddToFavorites({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<FavoriteCubit>(context);
        return Container(
          width: 65.0,
          height: 55.0,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: IconButton(
              onPressed: () {
                cubit.favPressed(context, productModel);
              },
              icon: Icon(
                Icons.favorite_border_sharp,
                size: 35.0,
                color: cubit.getFavIconColor(productModel),
              )),
        );
      },
    );
  }
}
