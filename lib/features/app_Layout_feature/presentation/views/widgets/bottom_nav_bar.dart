import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/view_models/home_layout_cubit/app_layout_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          tabBorderRadius: 16,
          curve: Curves.easeOutExpo,
          tabBackgroundColor: Colors.grey.shade800,
          onTabChange: (index) {
            BlocProvider.of<AppLayoutCubit>(context).onNavBarTap(index);
          },
          selectedIndex: BlocProvider.of<AppLayoutCubit>(context).initialPage,
          duration: const Duration(milliseconds: 700),
          gap: 8,
          color: Colors.grey[800],
          activeColor: const Color(appSecondaryColor),
          iconSize: 24,
          padding: const EdgeInsets.all(8.0),
          tabs: BlocProvider.of<AppLayoutCubit>(context).navBarTabs,
        ),
      ),
    );
  }
}
