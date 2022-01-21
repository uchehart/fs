import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/gifting/gift_a_meal_screen.dart';
import 'package:foodsub/ui/views/gifting/redeem_meal_screen.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';
import 'package:foodsub/utilities/exts.dart';

class GiftingScreen extends StatelessWidget {
  const GiftingScreen({Key? key}) : super(key: key);
  static const routeName = "/gifting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: const IconThemeData(color: AppColors.ash),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Gifting",
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
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  GiftAMealScreen.routeName,
                );
              },
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gift a Subscription",
                      style: AppTextStyles.subtitle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Make someone happy with food",
                      style: AppTextStyles.smallText,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RedeemMealScreen.routeName,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Redeem a subscription",
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Make someone’s day by paying for their subscription",
                    style: AppTextStyles.smallText,
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
