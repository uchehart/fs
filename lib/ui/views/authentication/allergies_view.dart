// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/authentication/verify_phone_number_view.dart';
import 'package:foodsub/ui/views/shared/widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class AllergiesView extends StatelessWidget {
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
          "Allergies",
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
                title: "Do you experience any food allergy?",
              ),
              SizedBox(
                height: 24,
              ),
              AppTextField(
//              validator: ,
//            controller: ,
                title: "What are you allergic to?",
              ),
              SizedBox(
                height: 16,
              ),
              AppTextField(
//              validator: ,
//            controller: ,
                title: "Others, specify:",
              ),
              SizedBox(
                height: 16,
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
                              builder: (context) => VerifyPhoneNumberView())),
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
