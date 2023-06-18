import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';

class ProviderAuthFormItem extends StatelessWidget {
  const ProviderAuthFormItem(
      {Key? key, required this.image, required this.onTap})
      : super(key: key);

  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 31.0,
        child: CircleAvatar(
          radius: 30.0,
          backgroundColor: const Color(appPrimaryColor),
          child: Image.asset(
            image,
            width: 20.0,
          ),
        ),
      ),
    );
  }
}
