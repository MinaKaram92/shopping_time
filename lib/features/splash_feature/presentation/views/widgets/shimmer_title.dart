import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

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
          style: AppTextStyles.style30Bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
