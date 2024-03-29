// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';
import 'package:foodsub/ui/views/shared/widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/widgets/app_textfield.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

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
          "Reset Password",
          style: AppTextStyles.heading3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                suffixIcon: Icon(
                  Icons.visibility,
                  color: AppColors.orange,
                ),
//              validator: ,
//            controller: ,
                title: "New Password",
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
                title: "Confirm New Password",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: "Next",
//                      onPressed: () => Navigator.of(context).push(
//                          MaterialPageRoute(
//                              builder: (context) => AllergiesView())),
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
