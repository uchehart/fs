import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodsub/ui/views/cart/cart_view.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/widgets/big_button.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_controller.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_view.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryScheduleView extends StatelessWidget {
  const DeliveryScheduleView({Key? key}) : super(key: key);

  static const routeName = "/subscribe-delivery-schedule";

  @override
  Widget build(BuildContext context) {
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
            "Delivery Schedule",
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
                onPressed: () => Navigator.pushNamed(
                  context,
                  NotificationScreen.routeName,
                ),
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: AppColors.ash,
                ),
              ),
            ),
          ],
        ),
        body: Consumer2<DeliveryScheduleController, SubscribeController>(
          builder: (context, scheCtrl, subCtrl, child) {
            final selectedDays = subCtrl.selectedDays;
            return Column(
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
                Expanded(
                  child: ListView.separated(
                    physics: bouncingScrollPhysics,
                    padding: const EdgeInsets.only(bottom: 16.0),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 24.0),
                    itemBuilder: (context, index) {
                      final day = selectedDays[index];
                      final dayMeals = scheCtrl.dayMeals[day]!;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              left: 32.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${day.name.toNameCase().substring(0, 3)} "
                                  "${dayMeals.length}/$maxMeals",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.ash,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(CupertinoIcons.add_circled),
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    MealMenuView.routeName,
                                    arguments: day,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ReorderableListView(
                            physics: neverScrollPhysics,
                            buildDefaultDragHandles: false,
                            onReorder: (int oldIndex, int newIndex) =>
                                scheCtrl.reorderMeals(oldIndex, newIndex, day),
                            children: [
                              for (final meal in dayMeals)
                                Slidable(
                                  key: UniqueKey(),
                                  endActionPane: ActionPane(
                                    motion: const BehindMotion(),
                                    dragDismissible: false,
                                    extentRatio: 0.32,
                                    children: [
                                      SlidableAction(
                                        icon: Icons.swap_horiz,
                                        onPressed: (context) =>
                                            Navigator.pushNamed(
                                          context,
                                          MealMenuView.routeName,
                                          arguments: day,
                                        ),
                                        backgroundColor: AppColors.orange,
                                        foregroundColor: Colors.white,
                                        label: "Replace Meal",
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      boxShadow: boxShadow,
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                      right: 12.0,
                                      left: 20.0,
                                      top: 12.0,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 32.0,
                                      vertical: 16.0,
                                    ),
                                    child: Row(
                                      children: [
                                        ReorderableDragStartListener(
                                          index: dayMeals.indexOf(meal),
                                          child: Container(
                                            padding: const EdgeInsets.all(4.0),
                                            child: const Icon(Icons.menu),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF3F3F3),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12.0),
                                        Container(
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF3F3F3),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16.0),
                                            ),
                                          ),
                                          child: Image.asset(
                                            meal.thumb,
                                            height: 48.0,
                                            width: 48.0,
                                          ),
                                        ),
                                        const SizedBox(width: 12.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${meal.name} with",
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.ash,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              const SizedBox(height: 4.0),
                                              Text(
                                                meal.additions.value
                                                    .map((add) => add.name)
                                                    .join(", "),
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.ash,
                                                ),
                                              ),
                                              const SizedBox(height: 4.0),
                                              Text(
                                                "${meal.cals} cal",
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.ash,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => IconButton(
                                            icon: const Icon(Icons.more_vert),
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              final slider =
                                                  Slidable.of(context)!;
                                              if (!slider.animation.isCompleted) {
                                                slider.openEndActionPane();
                                              } else {
                                                slider.close();
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                            shrinkWrap: true,
                          ),
                        ],
                      );
                    },
                    itemCount: selectedDays.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                  child: BigButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      CartView.routeName,
                    ),
                    label: "Next",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
