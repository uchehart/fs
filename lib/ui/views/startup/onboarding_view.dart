// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/authentication/sigin_in_view.dart';
import 'package:foodsub/ui/views/shared/widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/images.dart';
import 'package:foodsub/ui/views/shared/widgets/onboarding_column.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;

  final int numPages = 3;

  PageController? pageController;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  void onInit() {
    pageController?.dispose();

    super.initState();
  }

  void onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.orange : Colors.grey[500],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.white),
      ),
    );
  }

  final List<OnboardingColumn> onboardingPages = <OnboardingColumn>[
    const OnboardingColumn(
      imgPath: onboarding1,
      titletext: 'Delicious Food',
      subtitleText:
          'Want yummy and healthy food? Enjoy delicious food at affordable prices.',
    ),
    const OnboardingColumn(
      imgPath: onboarding2,
      titletext: 'Fast Delivery',
      subtitleText:
          'Good food delivered at your doorstep. We care about your precious time.',
    ),
    const OnboardingColumn(
      imgPath: onboarding3,
      titletext: 'Track Order',
      subtitleText: 'Easily track your order to know when it will reach you.',
    )
  ];

  //  const OnboardingView({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: pageController,
                onPageChanged: onChangedFunction,
                children: onboardingPages,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            AppButton(
                label: "Get Started",
                color: AppColors.orange,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInView())),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 100)),
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: currentIndex == onboardingPages.length - 1
                  ? const Text("")
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              pageController?.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          ),
                        ]
                            // style: kTextStyle,
                            ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
