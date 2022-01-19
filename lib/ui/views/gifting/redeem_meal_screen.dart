import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/gifting/view_meal_plan_screen.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/colors.dart';

class RedeemMealScreen extends StatelessWidget {
  const RedeemMealScreen({Key? key}) : super(key: key);
  static const routeName = "/redeemMeal";
  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.ash),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Redeem Meal Plan",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.ash,
            fontSize: 18.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NotificationScreen.routeName,
                );
              },
              icon: const Icon(
                CupertinoIcons.bell,
                color: AppColors.ash,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextField(
//              validator: ,
                controller: codeController,
                hintText: "Food Code",
                title: "",
              ),
              AppTextField(
//              validator: ,
                controller: codeController,
                hintText: "Email Address",
                title: "",
              ),
              const SizedBox(
                height: 24,
              ),
              AppButton(
                label: "Next",
                onPressed: () =>
                    Navigator.pushNamed(context, ViewMealPlanScreen.routeName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
