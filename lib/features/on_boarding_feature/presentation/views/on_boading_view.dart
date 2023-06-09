import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_cubit.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_states.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnBoardingStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor:
                BlocProvider.of<OnboardingCubit>(context).backgroundColor,
            body: const SafeArea(
              child: OnBoardingViewBody(),
            ),
          );
        },
      ),
    );
  }
}
