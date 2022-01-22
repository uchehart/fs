import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';
import 'package:foodsub/utilities/exts.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({Key? key}) : super(key: key);
  static const routeName = "/receiptScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ), // iconTheme: const IconThemeData(color: AppColors.ash),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Receipt",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.width(20)),
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "You made Josh Happy",
                  style: AppTextStyles.heading3,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Your Order",
                style: AppTextStyles.heading3,
              ),
              Text(
                "Tuesday, Jan. 11th, 2022 at 10:00am",
                style: AppTextStyles.smallText,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                decoration: const BoxDecoration(
                    color: Color(0xffFFECC5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: AppTextStyles.smallSubtitle,
                            ),
                            Text(
                              "Josh2funny",
                              style: AppTextStyles.smallSubtitle,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Total amount",
                              style: AppTextStyles.smallSubtitle,
                            ),
                            Text(
                              "#10,000",
                              style: AppTextStyles.smallSubtitle,
                            ),
                          ],
                        ),
                        const Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: AppTextStyles.smallSubtitle,
                            ),
                            Text(
                              "Josh2funny@hotmail.com",
                              style: AppTextStyles.smallSubtitle,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Plan",
                              style: AppTextStyles.smallSubtitle,
                            ),
                            Text(
                              "Weekly",
                              style: AppTextStyles.smallSubtitle,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    label: "Download",
                    onPressed: () {},
                  ),
                  AppButton(
                    label: "Share",
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
