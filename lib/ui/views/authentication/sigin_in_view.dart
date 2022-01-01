// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/authentication/sign_up_view.dart';
import 'package:foodsub/ui/views/home/home_screen.dart';
import 'package:foodsub/ui/views/shared/widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: AppTextStyles.heading1,
            ),
            SizedBox(
              height: 24,
            ),
            AppTextField(
//              validator: ,
//            controller: ,
              title: "Email Address",
            ),
            SizedBox(
              height: 16,
            ),
            AppTextField(
              suffixIcon: Icon(
                Icons.visibility,
                color: AppColors.orange,
              ),
//              validator: ,
//            controller: ,
              title: "Password",
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forgot password? "),
                Text(
                  "Reset Password",
                  style: AppTextStyles.smallSubtitle
                      .copyWith(color: AppColors.orange),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: "Sign In",
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreenView.routeName,
                      (route) => false,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpView())),
                  child: Text(
                    "Sign Up",
                    style: AppTextStyles.smallSubtitle
                        .copyWith(color: AppColors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
