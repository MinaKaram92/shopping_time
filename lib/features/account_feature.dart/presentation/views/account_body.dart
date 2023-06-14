import 'package:flutter/material.dart';
import 'package:shopping_time/core/widgets/menu_navigation_item.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MenuNavigationItem(
          title: 'Edit Profile',
          leading: Icons.person,
          onTap: () {},
          trailing: true,
        ),
        MenuNavigationItem(
          title: 'Shipping Address',
          leading: Icons.location_pin,
          onTap: () {},
          trailing: true,
        ),
        MenuNavigationItem(
          title: 'Order History',
          leading: Icons.history,
          onTap: () {},
          trailing: true,
        ),
        MenuNavigationItem(
          title: 'Cards',
          leading: Icons.credit_card,
          onTap: () {},
          trailing: true,
        ),
        MenuNavigationItem(
          title: 'Sign Out',
          leading: Icons.logout,
          onTap: () {},
          trailing: true,
        ),
      ],
    );
  }
}
