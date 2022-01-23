import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/gifting/model/gift_meal_pill.dart';
import 'package:foodsub/ui/views/gifting/receiver_detail_screen.dart';
import 'package:foodsub/ui/views/gifting/view_model/gifting_view_model.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_button.dart';
import 'package:foodsub/ui/views/shared/Widgets/app_textfield.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class GiftAMealScreen extends StatefulWidget {
  const GiftAMealScreen({Key? key}) : super(key: key);
  static const routeName = "/giftAMeal";

  @override
  State<GiftAMealScreen> createState() => _GiftAMealScreenState();
}

class _GiftAMealScreenState extends State<GiftAMealScreen> {
  @override
  int rval = 0;
  onChange(val) {
    setState(() {
      rval = val;
    });
  }

  bool selected = false;
  int rval1 = 0;
  onChange1(val) {
    setState(() {
      rval1 = val;
      // selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = GiftingViewModel();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.ash),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Gift a meal",
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => GiftMealPill(
                selection: controller.meal[index].selection,
                noOfMeals: controller.meal[index].noOfMeals,
                price: controller.meal[index].price,
                groupValue: rval1,
                value: index,
                onPressed: (val) => onChange1(val),
                isSelected: rval1 == index ? selected = true : selected = false,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.orange,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: rval,
                        onChanged: (int? rval) {
                          onChange(rval);
                        },
                      ),
                      Text(
                        "Default  #4000",
                        style: AppTextStyles.subtitle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: rval,
                          onChanged: (val) => onChange(val)),
                      Text(
                        "Custom",
                        style: AppTextStyles.subtitle,
                      )
                    ],
                  ),
                  rval == 1
                      ? Container(
                          width: 200,
                          child: const AppTextField(
                            hintText: "Enter here...",
                            title: "",
                          ),
                        )
                      : Text(""),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            AppButton(
              label: "Next",
              onPressed: () =>
                  Navigator.pushNamed(context, ReceiverDetailScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
