part of '../view_model/onboarding_cubit.dart';

class OnboardingState {
  int currentIndex;
  int numPages;
  PageController? pageController;

  OnboardingState(
      {required this.currentIndex,
      required this.numPages,
      this.pageController});
}
