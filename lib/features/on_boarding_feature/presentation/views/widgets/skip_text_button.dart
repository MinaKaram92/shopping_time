import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/features/on_boarding_feature/utils/on_boarding_text_styles.dart';

import '../../view_models/on_boarding_cubit.dart';

class SkipTextButton extends StatelessWidget {
  const SkipTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: TextButton(
          onPressed: () {
            BlocProvider.of<OnboardingCubit>(context).onBoardingDone = true;
            CacheHelper.saveData('onBoardingValue', true);
            GoRouter.of(context).go(AppRouter.kLogin);
          },
          child: const Text(
            'Skip',
            style: OnBoardingTextStyles.textStyle20,
          ),
        ),
      ),
    );
  }
}
