import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/on_boarding_feature/data/data_models.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_cubit.dart';
import 'package:shopping_time/features/on_boarding_feature/utils/on_boarding_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: BlocProvider.of<OnboardingCubit>(context).startedIndex,
      count: OnBoardingData.onBoardingModels.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Color(
          onBoardingPrimaryColor,
        ),
        dotColor: Colors.white,
      ),
    );
  }
}
