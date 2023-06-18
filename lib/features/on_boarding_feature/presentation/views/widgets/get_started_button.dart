import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_cubit.dart';
import 'package:shopping_time/features/on_boarding_feature/utils/on_boarding_constants.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            BlocProvider.of<OnboardingCubit>(context).onBoardingDone = true;
            CacheHelper.saveData('onBoardingValue', true);
            GoRouter.of(context).go(AppRouter.kLogin);
          },
          color: const Color(onBoardingPrimaryColor),
          textColor: Colors.white,
          child: const Text(
            'Get Started',
            style: AppTextStyles.textStyle22,
          ),
        ),
      ),
    );
  }
}
