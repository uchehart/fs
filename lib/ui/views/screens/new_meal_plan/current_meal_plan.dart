import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'current_meal_list.dart';

class CurrentMeal extends StatefulWidget {
  const CurrentMeal({Key? key}) : super(key: key);

  @override
  State<CurrentMeal> createState() => _CurrentMealMeal();
}

class _CurrentMealMeal extends State<CurrentMeal> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
          ),
          title: Text("Back",
              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 14)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NotificationScreen.routeName,
                );
              },
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: AppColors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20, top: 15.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Current Plan',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ash,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.more_vert_outlined,
                        color: AppColors.black),
                    const Spacer(),
                    Container(
                      width: 86,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: AppColors.notification1,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          )),
                      child: Text(
                        'See full plan',
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Weekly plan',
                    style: GoogleFonts.montserrat(
                      color: AppColors.ash,
                      fontSize: 14.0,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Text(
                        'Expires',
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 7.0,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '>>  October 20, 2021',
                        style: GoogleFonts.montserrat(
                          color: AppColors.ash,
                          fontSize: 12.0,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.autorenew_outlined,
                          color: AppColors.black),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.notification1,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    )),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: meal.length,
                  itemBuilder: (context, index) {
                    if (index == meal.length) {
                      return Container(
                        height: 20,
                      );
                    }
                    return index.isInfinite
                        ? const Text('List Empty')
                        : meal.elementAt(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
