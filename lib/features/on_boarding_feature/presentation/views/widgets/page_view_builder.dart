import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/on_boarding_feature/data/data_models.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_cubit.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/views/widgets/on_boarding_item.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: cubit.pageController,
        itemCount: OnBoardingData.onBoardingModels.length,
        itemBuilder: (context, index) => OnBoardingItem(
          model: OnBoardingData.onBoardingModels[index],
        ),
        onPageChanged: (index) {
          cubit.updateView(index);
        },
      ),
    );
  }
}
