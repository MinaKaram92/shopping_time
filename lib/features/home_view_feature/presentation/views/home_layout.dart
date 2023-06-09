import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_layout_cubit/home_layout_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_layout_cubit/home_layout_state.dart';
import 'package:shopping_time/core/widgets/custom_app_bar.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/home_layout_drawer.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeLayoutCubit>(context);
        return Scaffold(
          backgroundColor: const Color(appPrimaryColor),
          appBar: CustomAppBar(
              appBar: AppBar(),
              title: 'Shopping Time',
              centerTitle: true,
              actionIcon: Icons.shopping_cart,
              actionPressed: () {
                GoRouter.of(context).push(AppRouter.kCartView);
              }),
          body: cubit.navBarScreens[cubit.initialPage],
          drawer: const HomeViewDrawer(),
          //bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
