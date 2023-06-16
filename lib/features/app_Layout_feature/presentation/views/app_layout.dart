import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/widgets/custom_app_bar.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/view_models/home_layout_cubit/app_layout_cubit.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/view_models/home_layout_cubit/app_layout_state.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/views/widgets/navigation_drawer.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AppLayoutCubit>(context);
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
          drawer: const NavigationDrawer(),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
