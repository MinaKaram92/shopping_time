import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/navigation_drawer_header.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/drawer_menu_items.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(appPrimaryColor),
      child: Column(
        children: const [
          NavigationDrawerHeader(),
          DrawerMenuItems(),
        ],
      ),
    );
  }
}
