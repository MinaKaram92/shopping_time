import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/utils/service_locator.dart';
import 'package:shopping_time/features/home_view_feature/data/repos/home_body_repo/home_body_repo_impl.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_body_products_cubit/home_body_products_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_body_products_cubit/home_body_products_states.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/categories_builder.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/products_grid_view_builder.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/search_product.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchProduct(),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 8.0),
                child: Text(
                  'Categories',
                  style: AppTextStyles.titleStyle,
                ),
              ),
              CategoriesBuilder(),
              Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                child: Text(
                  'Explore',
                  style: AppTextStyles.titleStyle,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider<HomeBodyProductsCubit>(
            create: (context) =>
                HomeBodyProductsCubit(ServiceLocator.sl.get<HomeBodyRepoImpl>())
                  ..getHomeBodyProducts(),
            child: BlocBuilder<HomeBodyProductsCubit, HomeBodyProductsStates>(
              builder: (context, state) => ConditionalBuilder(
                condition: state is SuccessHomeBodyProductsState,
                builder: (context) {
                  final cubit = BlocProvider.of<HomeBodyProductsCubit>(context);
                  return ProductsGridViewBuilder(
                    products: cubit.productsList,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  );
                },
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
