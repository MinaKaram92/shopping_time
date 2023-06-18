import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.appBar,
    required this.title,
    required this.centerTitle,
    this.leading,
    required this.actionIcon,
    required this.actionPressed,
  }) : super(key: key);
  final AppBar appBar;
  final String title;
  final bool centerTitle;
  final Widget? leading;
  final IconData actionIcon;
  final VoidCallback actionPressed;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(30.0),
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(
              color: Color(appSecondaryColor), fontWeight: FontWeight.w400),
        ),
        titleSpacing: 0.0,
        centerTitle: centerTitle,
        backgroundColor: const Color(appPrimaryColor),
        elevation: 0,
        leading: leading,
        iconTheme: const IconThemeData(color: Color(appSecondaryColor)),
        actions: [
          IconButton(
            onPressed: actionPressed,
            icon: Icon(
              actionIcon,
              color: const Color(appSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
