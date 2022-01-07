import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingState(
            currentIndex: 0, numPages: 3, pageController: PageController()));

  void onChangedFunction(int index) {
    emit(OnboardingState(
        currentIndex: index,
        numPages: state.numPages,
        pageController: state.pageController));
  }
}
