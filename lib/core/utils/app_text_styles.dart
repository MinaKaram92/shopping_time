import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const textStyle20 =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400);

  /* static const textStyle20 = TextStyle(
    color: Color(onBoardingPrimaryColor),
    fontSize: 20.0,
  ); */

  static const textStyle24Reg =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400);

  static const textStyle24Bold =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

  static const textStyle18Bold =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700);

  static const textStyle18Reg =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);

  static const textStyle18 = TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static const style30Bold = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );

  static const textStyle22 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22.0,
    color: Colors.white,
  );
}
