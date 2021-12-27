// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/home/home_screen.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class ChangePasswordView extends StatelessWidget {
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
          "Change Password",
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
                title: "Old Password",
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
                      label: "Update Password",
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomeScreenView()),
                      ),
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
