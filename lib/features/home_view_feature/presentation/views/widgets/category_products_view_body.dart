import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/category_products_cubit/category_products_states.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/products_grid_view_builder.dart';

class CategoryProductsViewBody extends StatelessWidget {
  const CategoryProductsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsStates>(
      builder: (context, state) => ConditionalBuilder(
        condition: state is SuccessCategoryProductsState,
        builder: (context) {
          final cubit = BlocProvider.of<CategoryProductsCubit>(context);
          return ProductsGridViewBuilder(products: cubit.categoryProductsList);
        },
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
