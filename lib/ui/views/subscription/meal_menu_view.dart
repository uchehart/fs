import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/subscription/meal_order_view.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_controller.dart';
import 'package:foodsub/ui/views/subscription/shared/big_button.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enums.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MealMenuView extends StatelessWidget {
  const MealMenuView({Key? key}) : super(key: key);

  static const routeName = "/subscribe-meal-menu";

  @override
  Widget build(BuildContext context) {
    final lastController = SubscribeController.instance;
    final thisController = MealMenuController.instance;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: AnimatedBuilder(
        animation: thisController,
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.ash),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              "Menu",
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
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bell,
                    color: AppColors.ash,
                  ),
                ),
              )
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
                child: ListView.separated(
                  physics: bouncingPhysics,
                  padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final type = mealTypes[index];
                    return GestureDetector(
                      onTap: () => thisController.setMealType(type),
                      child: Container(
                        decoration: BoxDecoration(
                          color: type == lastController.selectedMealType
                              ? AppColors.orange
                              : Colors.white,
                          boxShadow: type != lastController.selectedMealType
                              ? boxShadow
                              : null,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        width: context.widthBy(0.232),
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
                                color: type != lastController.selectedMealType
                                    ? AppColors.ash
                                    : Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: mealTypes.length,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: bouncingPhysics,
                  padding: const EdgeInsets.all(32.0),
                  itemCount: thisController.availableMeals.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24.0),
                  itemBuilder: (context, index) {
                    final meal = thisController.availableMeals[index];
                    final smallText = GoogleFonts.montserrat(
                      color: meal != thisController.selectedMeal
                          ? AppColors.ash
                          : Colors.white,
                      fontSize: 12.0,
                    );
                    return GestureDetector(
                      onTap: () => thisController.setMeal(meal),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: meal != thisController.selectedMeal
                              ? boxShadow
                              : null,
                          color: meal == thisController.selectedMeal
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
                                      color: meal != thisController.selectedMeal
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
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: meal !=
                                                      thisController
                                                          .selectedMeal
                                                  ? AppColors.ratingGold
                                                  : Colors.white,
                                            );
                                          },
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
                            IconButton(
                              onPressed: () =>
                                  thisController.toggleHearted(meal),
                              icon: Icon(
                                meal.hearted
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                color: meal != thisController.selectedMeal
                                    ? AppColors.orange
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                child: BigButton(
                  label: "Next",
                  onTap: () => Navigator.pushNamed(
                    context,
                    MealOrderView.routeName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
