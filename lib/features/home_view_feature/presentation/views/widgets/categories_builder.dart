import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_layout_cubit/home_layout_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/category_item.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 1.2 / 5,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var categoryItem =
                BlocProvider.of<HomeLayoutCubit>(context).categories[index];
            return GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kCategoryProductsView, extra: categoryItem);
              },
              child: CategoryItem(
                categoryItem: categoryItem,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10.0),
          itemCount:
              BlocProvider.of<HomeLayoutCubit>(context).categories.length),
    );
  }
}
