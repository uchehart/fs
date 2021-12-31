import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/subscription/meal_info_controller.dart';
import 'package:foodsub/ui/views/subscription/shared/big_button.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';

class MealInfoView extends StatelessWidget {
  const MealInfoView({Key? key}) : super(key: key);

  static const routeName = "/subscribe-meal-info";

  @override
  Widget build(BuildContext context) {
    final controller = MealInfoController.instance;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.ash),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              controller.meal.name,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: AppColors.ash,
                fontSize: 18.0,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 32.0),
            physics: bouncingPhysics,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      controller.meal.image,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: controller.meal.count > 1
                              ? controller.decrementServings
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
                            "${controller.meal.count}",
                            style: GoogleFonts.montserrat(color: AppColors.ash),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: controller.meal.count < 10
                              ? controller.incrementServings
                              : null,
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 156.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (final attribute in mealAttributes)
                            GestureDetector(
                              onTap: () => controller.setPagerIndex(
                                mealAttributes.indexOf(attribute),
                              ),
                              child: Text(
                                attribute,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: controller.showingAttr == attribute
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
                          physics: bouncingPhysics,
                          itemCount: mealAttributes.length,
                          controller: controller.pager = PageController(
                            viewportFraction: 1.128,
                            initialPage:
                                mealAttributes.indexOf(controller.showingAttr),
                          ),
                          onPageChanged: controller.setShowingAttr,
                          itemBuilder: (context, index) {
                            return FractionallySizedBox(
                              widthFactor:
                                  1 / controller.pager.viewportFraction,
                              child: index == 0
                                  ? Center(
                                      child: SingleChildScrollView(
                                        physics: bouncingPhysics,
                                        child: Text(
                                          controller.meal.description,
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
                                            physics: bouncingPhysics,
                                            itemCount: controller
                                                .meal.ingredients.length,
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
                                              final ingredient = controller
                                                  .meal.ingredients[index];
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
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                  physics: bouncingPhysics,
                                                  itemCount: controller.meal
                                                      .nutritionalValues.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        for (final part
                                                            in controller.meal
                                                                    .nutritionalValues[
                                                                index])
                                                          Text(
                                                            part,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color:
                                                                  AppColors.ash,
                                                              fontSize: 12.0,
                                                            ),
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                  shrinkWrap: true,
                                                ),
                                              ),
                                            ),
                                            const Divider(color: AppColors.ash),
                                            const SizedBox(height: 2.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "🔥 ${controller.meal.cals} cal",
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28.0),
                Text(
                  "Additions",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final addition in controller.availableAdditions)
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => controller.toggleAddition(addition),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: !addition.added
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
                                if (addition.added)
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
                  child: DropdownButton<String>(
                    value: controller.preference,
                    onChanged: controller.setPreference,
                    underline: const SizedBox.shrink(),
                    isExpanded: true,
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
                const SizedBox(height: 24.0),
                BigButton(
                  label: "Add To Cart",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
