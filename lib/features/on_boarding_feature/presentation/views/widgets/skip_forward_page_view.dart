import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_cubit.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/skip_text_button.dart';
import 'package:shopping_time/features/on_boarding_feature/utils/on_boarding_constants.dart';

class SkipForwardPageView extends StatelessWidget {
  const SkipForwardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SkipTextButton(),
          const Spacer(),
          IconButton(
            onPressed: () {
              BlocProvider.of<OnboardingCubit>(context).pageController.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(onBoardingPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
