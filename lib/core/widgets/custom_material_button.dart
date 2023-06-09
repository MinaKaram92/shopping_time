import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: const Color(appSecondaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: onPressed,
        height: 45.0,
        child: Text(
          text,
          style: AppTextStyles.textStyle20,
        ),
      ),
    );
  }
}
