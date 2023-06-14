import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Color(appSecondaryColor)),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/images/logo.png',
        ),
      ),
      accountName: Text(
        'John Doe',
        style: AppTextStyles.textStyle18Bold,
      ),
      accountEmail: Text(
        'johndoe@example.com',
      ),
    );
  }
}
