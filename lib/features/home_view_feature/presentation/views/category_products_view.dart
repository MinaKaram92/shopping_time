import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/utils/service_locator.dart';
import 'package:shopping_time/features/home_view_feature/data/models/category_model.dart';
import 'package:shopping_time/features/home_view_feature/data/repos/home_body_repo/home_body_repo_impl.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/category_products_view_body.dart';
import 'package:shopping_time/core/widgets/custom_app_bar.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({Key? key, required this.categoryItem})
      : super(key: key);
  final CategoryModel categoryItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryProductsCubit(ServiceLocator.sl.get<HomeBodyRepoImpl>())
            ..getCategoryProducts(categoryItem.model),
      child: Scaffold(
          appBar: CustomAppBar(
            appBar: AppBar(),
            title: categoryItem.name,
            leading: backArrow(context),
            actionIcon: Icons.shopping_cart,
            actionPressed: () {},
            centerTitle: true,
          ),
          body: const CategoryProductsViewBody()),
    );
  }
}
