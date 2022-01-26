import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_controller.dart';
import 'package:foodsub/ui/views/subscription/meal_info_view.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enumerations.dart';
import 'package:foodsub/utilities/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MealMenuView extends StatelessWidget {
  const MealMenuView({Key? key, required this.day}) : super(key: key);

  static const routeName = "/subscribe-meal-menu";

  final Day day;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.ash),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "${day.name.toNameCase()} Menu",
            style: GoogleFonts.montserrat(
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: boxShadow,
                  color: Colors.white,
                ),
                height: 48.0,
                child: TextField(
                  onChanged: (value) {},
                  cursorColor: AppColors.ash,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.search),
                    contentPadding:
                        const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: emptyInputBorder,
                    focusedBorder: emptyInputBorder,
                    hintStyle: GoogleFonts.montserrat(
                      color: AppColors.borderAsh,
                      fontSize: 16.0,
                    ),
                    hintText: "Search",
                  ),
                  style: GoogleFonts.montserrat(
                    color: AppColors.ash,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 164.0,
              child: Consumer<SubscribeController>(
                builder: (context, subCtrl, child) => ListView.separated(
                  padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final type = mealTypes[index];
                    final selected = type == subCtrl.selectedMealType;
                    return GestureDetector(
                      onTap: () => subCtrl.setMealType(type),
                      child: Container(
                        width: context.width(96),
                        decoration: BoxDecoration(
                          color: selected ? AppColors.orange : Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: !selected ? boxShadow : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/${Day.values[index].name}_menu.png",
                              height: 56.0,
                              width: 56.0,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              type,
                              style: GoogleFonts.montserrat(
                                color: !selected ? AppColors.ash : Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  physics: bouncingScrollPhysics,
                  itemCount: mealTypes.length,
                ),
              ),
            ),
            Expanded(
              child: Consumer<DeliveryScheduleController>(
                builder: (context, scheCtrl, child) => ListView.separated(
                  padding: const EdgeInsets.all(32.0),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24.0),
                  itemBuilder: (context, index) {
                    final meal = Meal.samples[index];
                    final dayMeals = scheCtrl.dayMeals[day]!;
                    final smallText = GoogleFonts.montserrat(
                      color: !dayMeals.contains(meal)
                          ? AppColors.ash
                          : Colors.white,
                      fontSize: 12.0,
                    );

                    return GestureDetector(
                      onTap: () {
                        if (dayMeals.contains(meal) &&
                            {...dayMeals}.length > 1) {
                          scheCtrl.removeAllMeal(meal, day);
                        } else if (dayMeals.length < maxMeals &&
                            !dayMeals.contains(meal)) {
                          scheCtrl.addMeal(meal, day);
                        }
                      },
                      onLongPress: () => Navigator.pushNamed(
                        context,
                        MealInfoView.routeName,
                        arguments: [meal, day],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow:
                              !dayMeals.contains(meal) ? boxShadow : null,
                          color: dayMeals.contains(meal)
                              ? AppColors.orange
                              : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              meal.thumb,
                              height: 64.0,
                              width: 64.0,
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    meal.name,
                                    style: GoogleFonts.montserrat(
                                      color: !dayMeals.contains(meal)
                                          ? AppColors.ash
                                          : Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  if (meal.revs > 0)
                                    Row(
                                      children: [
                                        Text(
                                          meal.rating.toStringAsFixed(1),
                                          style: smallText,
                                        ),
                                        const SizedBox(width: 4.0),
                                        RatingBarIndicator(
                                          rating: meal.rating,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: !dayMeals.contains(meal)
                                                ? AppColors.ratingGold
                                                : Colors.white,
                                          ),
                                          itemSize: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          "(${meal.revs})",
                                          style: smallText,
                                        ),
                                      ],
                                    )
                                  else
                                    Text(
                                      "No Reviews Yet",
                                      style: smallText,
                                    ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    "₦ " +
                                        NumberFormat.decimalPattern()
                                            .format(meal.price),
                                    style: smallText,
                                  ),
                                ],
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: meal.hearted,
                              builder: (context, bool latest, child) =>
                                  IconButton(
                                onPressed: () => meal.hearted.value = !latest,
                                icon: Icon(
                                  latest
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color: !dayMeals.contains(meal)
                                      ? AppColors.orange
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  physics: bouncingScrollPhysics,
                  itemCount: Meal.samples.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
