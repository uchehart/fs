// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/authentication/allergies_view.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
          "Sign Up",
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
//              validator: ,
//            controller: ,
                title: "Full Name",
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
//              validator: ,
//            controller: ,
                title: "Phone Number",
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
              AppTextField(
//              validator: ,
//            controller: ,
                title: "State",
              ),
              SizedBox(
                height: 16,
              ),
              AppTextField(
//              validator: ,
//            controller: ,
                title: "Local Government",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Clicking on next means you’ve accepted our terms and conditions. ",
                      softWrap: true,
                      style: AppTextStyles.subtitle,
                    ),
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
                      label: "Next",
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => AllergiesView())),
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
