import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/meals.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/images.dart';
import 'package:google_fonts/google_fonts.dart';

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
          padding: const EdgeInsets.only(top: 10, left: 5.0, bottom: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              imgPath!,
              fit: BoxFit.fill,
              height: 88,
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
                          builder: (context) => const Meals())),
                      child: Text(
                        mealName!,
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 16.0,
                        ),
                      )),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Text(
                        mealTime!,
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        time!,
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        deliveryDate!,
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Delivered(context)
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
              child: const Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(Icons.more_vert_outlined, color: AppColors.black),
              ),
            ),
          ]),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
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
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 12.0,
          ),
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
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 12.0,
        ),
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
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Play Meal',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Skip Meal',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Stop meal',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Reschedule meal',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                  ),
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
