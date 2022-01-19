import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/gifting/checkout_screen.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/colors.dart';

class ReceiverDetailScreen extends StatelessWidget {
  const ReceiverDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/receiver";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.ash),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Receiver’s Details",
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
                // Navigator.pushNamed(
                //   context,
                //   // NotificationScreen.routeName,
                // );
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppTextField(
              title: "Name",
            ),
            const SizedBox(
              height: 24,
            ),
            const AppTextField(
              title: "Email Address",
            ),
            const SizedBox(
              height: 24,
            ),
            const AppTextField(
              title: "Phone Number",
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: "Pay With Card",
                    onPressed: () =>
                        Navigator.pushNamed(context, CheckoutScreen.routeName),
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
