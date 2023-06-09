import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_cubit.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_states.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/get_started_button.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/page_view_builder.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/page_view_indicator.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/skip_forward_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnboardingCubit>(context);
    return BlocBuilder<OnboardingCubit, OnBoardingStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              const PageViewBuilder(),
              PageViewIndicator(),
              const SizedBox(height: 20.0),
              cubit.isLastPage
                  ? const GetStartedButton()
                  : const SkipForwardPageView(),
            ],
          ),
        );
      },
    );
  }
}
