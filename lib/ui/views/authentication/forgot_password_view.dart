// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/authentication/change_password_view.dart';
import 'package:foodsub/ui/views/shared/widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 14,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Forgot Password",
          style: AppTextStyles.heading3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Enter your email address. A reset link will be sent vial email.",
                      softWrap: true,
                      style: AppTextStyles.subtitle
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
//              SizedBox(
//                height: 12,
//              ),
              AppTextField(
//              validator: ,
//            controller: ,

                title: " ",
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: "Send",
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordView())),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
