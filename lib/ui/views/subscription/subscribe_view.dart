import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_view.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/ui/views/shared/widgets/big_button.dart';
import 'package:foodsub/ui/views/shared/widgets/option_rect.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enums.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SubscribeView extends StatelessWidget {
  const SubscribeView({Key? key}) : super(key: key);

  static const routeName = "/subscribe";

  @override
  Widget build(BuildContext context) {
    final controller = SubscribeController.instance;
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
              "Subscribe For A Meal",
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
            physics: bouncingPhysics,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Which of the meals do you want to subscribe for?",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  height: 116.0,
                  child: Wrap(
                    runAlignment: WrapAlignment.spaceBetween,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (final type in mealTypes)
                        OptionRect(
                          onTap: () => controller.setMealType(type),
                          chosen: type == controller.selectedMealType,
                          width: context.width(164),
                          label: type,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Which days of the week do you want the meal delivered?",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final interval in deliveryIntervals)
                      OptionRect(
                        onTap: () => controller.setDeliveryInterval(interval),
                        chosen: interval == controller.selectedDeliveryInterval,
                        width: context.width(102),
                        label: interval,
                      ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final day in Day.values)
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: !controller.selectedDays.contains(day)
                                ? AppColors.borderAsh
                                : AppColors.orange,
                          ),
                        ),
                        height: 32.0,
                        width: 32.0,
                        child: Text(
                          day.name[0].toUpperCase(),
                          style: GoogleFonts.montserrat(
                            color: !controller.selectedDays.contains(day)
                                ? AppColors.borderAsh
                                : AppColors.orange,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Subscription Duration",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final duration in subscriptionDurations)
                      OptionRect(
                        onTap: () =>
                            controller.setSubscriptionDuration(duration),
                        chosen:
                            duration == controller.selectedSubscriptionDuration,
                        width: context.width(164),
                        label: duration,
                      ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Start Date",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () => showDatePicker(
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialDate: controller.selectedStartDate,
                    firstDate: DateTime.now(),
                    context: context,
                  ).then((date) {
                    if (date != null) controller.setStartDate(date);
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderAsh),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 48.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("MMMM d, y")
                              .format(controller.selectedStartDate),
                          style: GoogleFonts.montserrat(color: AppColors.ash),
                        ),
                        const Icon(
                          Icons.calendar_today,
                          color: AppColors.ash,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                BigButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    MealMenuView.routeName,
                  ),
                  label: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
