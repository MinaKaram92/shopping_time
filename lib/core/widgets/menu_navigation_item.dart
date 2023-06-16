import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';

class MenuNavigationItem extends StatelessWidget {
  const MenuNavigationItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.leading,
    this.trailing,
    this.subtitle,
    this.subtitleStyle,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final IconData leading;
  final IconData? trailing;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: subtitleStyle,
            )
          : null,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      horizontalTitleGap: 24.0,
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: 50.0,
        height: 50.0,
        child: Icon(
          leading,
          size: 30.0,
          color: const Color(appSecondaryColor),
        ),
      ),
      onTap: onTap,
      trailing: Icon(
        trailing,
        color: const Color(appSecondaryColor),
      ),
    );
  }
}
