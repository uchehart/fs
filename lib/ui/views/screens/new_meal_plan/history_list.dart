import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/current_meal_plan.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/images.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class History extends StatelessWidget {
  final String? imgPat;
  final String? planName;
  final String? planType;
  final String? planDate;
  final bool? subscribed;

  const History(
      {Key? key,
      this.imgPat,
      this.planName,
      this.planType,
      this.planDate,
      this.subscribed})
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
              imgPat!,
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CurrentMeal())),
                      child: Text(planName!, style: AppTextStyles.heading2)),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    planType!,
                    style: AppTextStyles.heading3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: Row(
                      children: [
                        Text(
                          planDate!,
                          style: AppTextStyles.smallSubtitle,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        planStatus(context)
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

  Container planStatus(BuildContext context) {
    if (subscribed!) {
      return Container(
        width: 60,
        height: 23,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 221, 39, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            )),
        child: Text(
          'Subscribed',
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
        'Expired',
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

final List<History> history = <History>[
  const History(
    imgPat: calendarCurrent,
    planName: 'Current Plan',
    planType: 'Weekly plan',
    planDate: 'October 20, 2021',
    subscribed: true,
  ),
  const History(
    imgPat: calendarPrev2,
    planName: 'Previous Plan',
    planType: 'Monthly plan',
    planDate: 'September 01, 2021',
    subscribed: false,
  ),
  const History(
    imgPat: calendarPrev,
    planName: 'Previous Plan',
    planType: 'Monthly plan',
    planDate: 'August 01, 2021',
    subscribed: false,
  ),
];
