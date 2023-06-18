import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/widgets/account_drawer_menu.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/views/widgets/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(appPrimaryColor),
      child: Column(
        children: const [
          NavigationDrawerHeader(),
          AccountDrawerMenu(trailing: false),
        ],
      ),
    );
  }
}
