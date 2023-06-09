import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';

abstract class AppTextStyles {
  static const titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    color: Color(appSecondaryColor),
  );

  static const textStyle20 =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400);

  static const textStyle24Reg =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400);

  static const textStyle24Bold =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

  static const textStyle18Bold =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700);

  static const textStyle18Reg =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);
}