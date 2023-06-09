import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping_time/features/on_boarding_feature/presentation/view_models/on_boarding_states.dart';

class OnboardingCubit extends Cubit<OnBoardingStates> {
  OnboardingCubit() : super(InitialOnBoardingState());

  bool onBoardingDone = false;

  final pageController = PageController();

  int startedIndex = 0;

  bool isLastPage = false;

  Color backgroundColor = const Color(0xff09828b);

  void _changeIndicator(int index) {
    startedIndex = index;
    if (startedIndex == 2) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }
  }

  void _changeBackgroundColor(int index) {
    if (index == 0) {
      backgroundColor = const Color(0xff09828b);
    } else if (index == 1) {
      backgroundColor = const Color(0xff1fb090);
    } else {
      backgroundColor = const Color(0xffffbe97);
    }
  }

  void updateView(int index) {
    _changeIndicator(index);
    _changeBackgroundColor(index);
    emit(UpdateViewState());
  }
}
