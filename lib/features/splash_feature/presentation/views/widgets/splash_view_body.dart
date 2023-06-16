import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/features/splash_feature/presentation/views/widgets/animated_logo.dart';
import 'package:shopping_time/features/splash_feature/presentation/views/widgets/shimmer_title.dart';
import 'package:shopping_time/features/splash_feature/presentation/views/widgets/sliding_splash_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scalingAnimation;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    navigateToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedLogo(scalingAnimation: scalingAnimation),
        const ShimmerTitle(),
        SlidingSplashText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initAnimations() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero)
            .animate(animationController);

    scalingAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (onBoarding == null) {
          GoRouter.of(context).go(AppRouter.kOnBoardingView);
        } else {
          if (currentUserId == null) {
            GoRouter.of(context).go(AppRouter.kLogin);
          } else {
            GoRouter.of(context).go(AppRouter.kAppLayout);
          }
        }
      },
    );
  }
}
