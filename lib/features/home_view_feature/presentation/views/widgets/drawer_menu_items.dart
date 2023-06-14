import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/widgets/menu_navigation_item.dart';

class DrawerMenuItems extends StatelessWidget {
  const DrawerMenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuNavigationItem(
          title: 'Profile',
          leading: Icons.person,
          onTap: () {},
        ),
        MenuNavigationItem(
          title: 'Favorites',
          leading: Icons.favorite,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kFavoritesView);
          },
        ),
        MenuNavigationItem(
          title: 'Cart',
          leading: Icons.shopping_cart,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
        ),
        MenuNavigationItem(
          title: 'Order History',
          leading: Icons.history,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
        ),
        MenuNavigationItem(
          title: 'Sign Out',
          leading: Icons.logout,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
        ),
      ],
    );
  }
}
