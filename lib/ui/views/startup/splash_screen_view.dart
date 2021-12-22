import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/startup/onboarding_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  void decideNavigation() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OnboardingView()));
  }

  void onInit() {
    decideNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OnboardingView())),
          child: const Center(
              child: Text(
            "next",
            style: TextStyle(color: Colors.white),
          ))),
    );
  }
}
