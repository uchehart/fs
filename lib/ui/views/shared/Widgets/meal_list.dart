import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/meals.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

import 'colors.dart';

class MealList extends StatelessWidget {
  final String? imgPath;
  final String? mealName;
  final String? mealTime;
  final String? time;

  const MealList({
    Key? key,
    this.imgPath,
    this.mealName,
    this.mealTime,
    this.time,
  }) : super(key: key);

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
                  Row(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.play_circle_outlined,
                          size: 14,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.pause_circle_outlined,
                          size: 14,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.timer_off_outlined,
                          size: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ],
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
