import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/meals.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/images.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class CurrentList extends StatelessWidget {
  final String? imgPath;
  final String? mealName;
  final String? mealTime;
  final String? time;
  final String? deliveryDate;
  final bool? delivered;

  const CurrentList(
      {Key? key,
      this.imgPath,
      this.mealName,
      this.mealTime,
      this.time,
      this.deliveryDate,
      this.delivered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 5.0, right: 20, bottom: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              imgPath!,
              fit: BoxFit.fill,
              height: 90,
              width: 108,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Meals())),
                      child: Text(mealName!, style: AppTextStyles.heading2)),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Text(
                        mealTime!,
                        style: AppTextStyles.heading3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        time!,
                        style: AppTextStyles.heading3,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: Row(
                      children: [
                        Text(
                          deliveryDate!,
                          style: AppTextStyles.smallSubtitle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Delivered(context)
                      ],
                    ),
                  )
                ]),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return MealDialog();
                    });
              },
              child: const Icon(Icons.more_vert_outlined,
                  size: 14, color: AppColors.black),
            ),
          ]),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }

  Container Delivered(BuildContext context) {
    if (delivered!) {
      return Container(
        width: 60,
        height: 23,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(101, 191, 115, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            )),
        child: Text(
          'Success',
          style: AppTextStyles.smallSubtitle,
        ),
      );
    }
    return Container(
      width: 60,
      height: 23,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(153, 21, 19, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )),
      child: Text(
        'No Success',
        style: AppTextStyles.smallSubtitle,
      ),
    );
  }
}

class MealDialog extends StatelessWidget {
  const MealDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        elevation: 0,
        content: SizedBox(
          height: 150,
          width: 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Pause Meal',
                  style: AppTextStyles.smallSubtitle,
                ),
              ),
              Center(
                child: Text(
                  'Play Meal',
                  style: AppTextStyles.smallSubtitle,
                ),
              ),
              Center(
                child: Text(
                  'Skip Meal',
                  style: AppTextStyles.smallSubtitle,
                ),
              ),
              Center(
                child: Text(
                  'Stop meal',
                  style: AppTextStyles.smallSubtitle,
                ),
              ),
              Center(
                child: Text(
                  'Reschedule meal',
                  style: AppTextStyles.smallSubtitle,
                ),
              ),
            ],
          ),
        ));
  }
}

final List<CurrentList> meal = <CurrentList>[
  const CurrentList(
    imgPath: breakFast,
    mealName: 'Egg Sauce',
    mealTime: 'Breakfast Time',
    time: '07: 30',
    deliveryDate: 'August 20, 2021',
    delivered: true,
  ),
  const CurrentList(
    imgPath: launch,
    mealName: 'Jollof Rice',
    mealTime: 'Lunch Time',
    time: '12: 30',
    deliveryDate: 'September 01, 2021',
    delivered: true,
  ),
  const CurrentList(
    imgPath: drink,
    mealName: 'Smothie',
    mealTime: 'Drink Time',
    time: '14: 30',
    deliveryDate: 'October 02 2021',
    delivered: false,
  ),
];
