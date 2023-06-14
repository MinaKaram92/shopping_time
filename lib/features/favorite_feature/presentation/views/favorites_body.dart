import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_states.dart';
import 'package:shopping_time/features/favorite_feature/presentation/views/widgets/favorite_item.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<FavoriteCubit>(context);
        return ConditionalBuilder(
          condition: cubit.favorites.isNotEmpty,
          builder: (context) {
            return ListView.separated(
              itemBuilder: (context, index) =>
                  FavoriteItem(productModel: cubit.favorites[index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
              itemCount: cubit.favorites.length,
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
