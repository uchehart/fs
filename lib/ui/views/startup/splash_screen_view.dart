import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/startup/onboarding_view.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);
  static const routeName = "/splashScreen";

  @override
  Widget build(BuildContext context) {
    //This code delays the splash screen and pushes the next page to the screen after the delay
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OnboardingView(),
        ),
      );
    });

    return const Scaffold(
      backgroundColor: AppColors.orange,
      // body: GestureDetector(
      //     onTap: () => Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => OnboardingView())),
      //     child: const Center(
      //         child: Text(
      //       "next",
      //       style: TextStyle(color: Colors.white),
      //     ))),
    );
  }
}
