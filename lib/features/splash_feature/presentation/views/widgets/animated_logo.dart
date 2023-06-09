import 'package:flutter/material.dart';
import 'package:shopping_time/core/utils/assets_data.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({Key? key, required this.scalingAnimation})
      : super(key: key);
  final Animation<double> scalingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scalingAnimation,
      builder: (context, _) {
        return ScaleTransition(
          scale: scalingAnimation,
          child: SizedBox(
            width: 150,
            height: MediaQuery.of(context).size.height * 1 / 5,
            child: Image.asset(AssetsData.logo),
          ),
        );
      },
    );
  }
}
