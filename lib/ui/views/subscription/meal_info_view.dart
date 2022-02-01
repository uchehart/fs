import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/models/addition.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enumerations.dart';
import 'package:foodsub/utilities/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MealInfoView extends StatelessWidget {
  const MealInfoView({
    Key? key,
    required this.day,
    required this.meal,
  }) : super(key: key);

  static const routeName = "/subscribe-meal-info";

  final Meal meal;
  final Day day;

  @override
  Widget build(BuildContext context) {
    final pager = PageController(
      initialPage: mealAttributes.indexOf(meal.attribute.value),
      viewportFraction: 1.128,
    );

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.ash),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            meal.name,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: AppColors.ash,
              fontSize: 18.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 32.0),
          physics: bouncingScrollPhysics,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    meal.image,
                    fit: BoxFit.cover,
                    height: 196.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Container(
                  width: context.width(132),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.orange,
                  ),
                  height: 48.0,
                  child: Consumer<DeliveryScheduleController>(
                    builder: (context, scheCtrl, child) {
                      final dayMeals = scheCtrl.dayMeals[day]!;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: dayMeals.length > 1
                                ? () => scheCtrl.removeMeal(meal, day)
                                : null,
                            padding: EdgeInsets.zero,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: context.width(28),
                            width: context.width(28),
                            child: Text(
                              dayMeals
                                  .where((element) => element == meal)
                                  .length
                                  .toString(),
                              style:
                                  GoogleFonts.montserrat(color: AppColors.ash),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: dayMeals.length < maxMeals
                                ? () => scheCtrl.addMeal(meal, day)
                                : null,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 156.0,
                child: ValueListenableBuilder(
                  valueListenable: meal.attribute,
                  builder: (context, String latest, child) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (final attribute in mealAttributes)
                            GestureDetector(
                              onTap: () => pager.animateToPage(
                                mealAttributes.indexOf(attribute),
                                duration: const Duration(milliseconds: 512),
                                curve: Curves.linear,
                              ),
                              child: Text(
                                attribute,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: latest == attribute
                                      ? AppColors.orange
                                      : AppColors.ash,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: PageView.builder(
                          physics: bouncingScrollPhysics,
                          itemCount: mealAttributes.length,
                          onPageChanged: (index) =>
                              meal.attribute.value = mealAttributes[index],
                          itemBuilder: (context, index) => FractionallySizedBox(
                            widthFactor: 1 / pager.viewportFraction,
                            child: index == 0
                                ? Center(
                                    child: SingleChildScrollView(
                                      physics: bouncingScrollPhysics,
                                      child: Text(
                                        meal.description,
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.ash,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  )
                                : index == 1
                                    ? Center(
                                        child: GridView.builder(
                                          physics: bouncingScrollPhysics,
                                          itemCount: meal.ingredients.length,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing:
                                                context.width(116),
                                            mainAxisSpacing: 2.0,
                                            mainAxisExtent: 20.0,
                                            crossAxisCount: 2,
                                          ),
                                          itemBuilder: (context, index) {
                                            final ingredient =
                                                meal.ingredients[index];
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.bulletAsh,
                                                  radius: 4.0,
                                                ),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  ingredient,
                                                  style: GoogleFonts.montserrat(
                                                    color: AppColors.ash,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: ListView.builder(
                                                physics: bouncingScrollPhysics,
                                                itemCount: meal.values.length,
                                                itemBuilder: (context, index) =>
                                                    Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    for (final part
                                                        in meal.values[index])
                                                      Text(
                                                        part,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: AppColors.ash,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                shrinkWrap: true,
                                              ),
                                            ),
                                          ),
                                          const Divider(color: AppColors.ash),
                                          const SizedBox(height: 2.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "🔥 ${meal.cals} cal",
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.ash,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              Text(
                                                "* Daily Value",
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.ash,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                          ),
                          controller: pager,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28.0),
              Text(
                "Additions",
                style: GoogleFonts.montserrat(color: AppColors.ash),
              ),
              const SizedBox(height: 8.0),
              ValueListenableBuilder(
                valueListenable: meal.additions,
                builder: (context, List<Addition> latest, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final addition in Addition.samples)
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (!latest.remove(addition)) {
                                latest.add(addition);
                              }

                              meal.additions.value = [...latest];
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: !latest.contains(addition)
                                          ? AppColors.borderAsh
                                          : Colors.green,
                                      width: 2.0,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(addition.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: context.height(64),
                                  width: context.width(82),
                                ),
                                if (latest.contains(addition))
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 4.0,
                                      top: 4.0,
                                    ),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 16.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            addition.name,
                            style: GoogleFonts.montserrat(
                              color: AppColors.ash,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 28.0),
              Text(
                "Preference",
                style: GoogleFonts.montserrat(color: AppColors.ash),
              ),
              const SizedBox(height: 8.0),
              Container(
                height: 52.0,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderAsh),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ValueListenableBuilder(
                  valueListenable: meal.preference,
                  builder: (context, String latest, child) => DropdownButton(
                    underline: const SizedBox.shrink(),
                    onChanged: (String? value) =>
                        meal.preference.value = value!,
                    isExpanded: true,
                    value: latest,
                    items: [
                      for (final pref in dummyPreferences)
                        DropdownMenuItem(
                          value: pref,
                          child: Text(
                            pref,
                            style: GoogleFonts.montserrat(color: AppColors.ash),
                          ),
                        ),
                    ],
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.borderAsh,
                    ),
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
