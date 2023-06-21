import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/widgets/no_items.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_states.dart';
import 'package:shopping_time/features/favorite_feature/presentation/views/widgets/favorite_item.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
      listener: (context, state) {
        if (state is LoadingFavoriteState) {
          const CircularProgressIndicator();
        } else if (state is FailureGetFavoritesState) {
          showSnack(context, SnackStatus.fail, state.errMessage);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<FavoriteCubit>(context);
        if (cubit.favorites.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) =>
                FavoriteItem(productModel: cubit.favorites[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16.0,
            ),
            itemCount: cubit.favorites.length,
          );
        } else {
          return const NoItems(
              image: 'assets/images/no_favorites.png',
              title: 'Favorites Is Empty');
        }
      },
    );
  }
}
