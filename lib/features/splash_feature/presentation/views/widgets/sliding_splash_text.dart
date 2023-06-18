import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';

class SlidingSplashText extends StatelessWidget {
  const SlidingSplashText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Buy whatever you want, wherever you are',
            style: TextStyle(
              color: Color(subtitleColor),
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
