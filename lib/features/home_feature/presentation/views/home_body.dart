import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/utils/service_locator.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/views/widgets/search_product.dart';
import 'package:shopping_time/features/home_feature/data/home_body_repo/home_body_repo_impl.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/home_body_products_cubit/home_body_products_cubit.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/home_body_products_cubit/home_body_products_states.dart';
import 'package:shopping_time/features/home_feature/presentation/views/widgets/categories_builder.dart';
import 'package:shopping_time/core/widgets/products_grid_view_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBodyProductsCubit>(
      create: (context) =>
          HomeBodyProductsCubit(ServiceLocator.sl.get<HomeBodyRepoImpl>())
            ..getHomeBodyProducts(),
      child: BlocConsumer<HomeBodyProductsCubit, HomeBodyProductsStates>(
        listener: (context, state) {
          if (state is FailureHomeBodyProductsState) {
            showSnack(context, SnackStatus.fail, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: productsList.isNotEmpty,
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SearchProduct(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                          child: Text(
                            'Categories',
                            style: AppTextStyles.style30Bold.copyWith(
                                color: const Color(appSecondaryColor)),
                          ),
                        ),
                        const CategoriesBuilder(),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 16.0),
                          child: Text(
                            'Explore',
                            style: AppTextStyles.style30Bold.copyWith(
                                color: const Color(appSecondaryColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProductsGridViewBuilder(
                      products: productsList,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              );
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
