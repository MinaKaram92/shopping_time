import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/widgets/products_grid_view_builder.dart';
import 'package:shopping_time/features/category_products_feature/presentation/view_models/category_products_cubit/category_products_cubit.dart';
import 'package:shopping_time/features/category_products_feature/presentation/view_models/category_products_cubit/category_products_states.dart';

class CategoryProductsViewBody extends StatelessWidget {
  const CategoryProductsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductsCubit, CategoryProductsStates>(
      listener: (context, state) {
        if (state is FailureCategoryProductsState) {
          showSnack(context, SnackStatus.fail, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is SuccessCategoryProductsState,
          builder: (context) {
            final cubit = BlocProvider.of<CategoryProductsCubit>(context);
            return ProductsGridViewBuilder(
                products: cubit.categoryProductsList);
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
