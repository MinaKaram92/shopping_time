import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/features/splash_feature/utils/splash_text_styles.dart';

class ShimmerTitle extends StatelessWidget {
  const ShimmerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
      child: Shimmer.fromColors(
        baseColor: const Color(appSecondaryColor),
        highlightColor: Colors.orange,
        period: const Duration(seconds: 2),
        child: const Text(
          'Shopping Time',
          style: SplashTextStyles.style30,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
