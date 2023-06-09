import 'package:flutter/material.dart';
import 'package:shopping_time/features/on_boarding_feature/utils/on_boarding_constants.dart';

abstract class OnBoardingTextStyles {
  static const textStyle30 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const textStyle22 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22.0,
    color: Colors.white,
  );

  static const textStyle20 = TextStyle(
    color: Color(onBoardingPrimaryColor),
    fontSize: 20.0,
  );
}
