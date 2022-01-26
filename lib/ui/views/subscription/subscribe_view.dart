import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/widgets/big_button.dart';
import 'package:foodsub/ui/views/shared/widgets/option_rect.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_view.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enumerations.dart';
import 'package:foodsub/utilities/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscribeView extends StatelessWidget {
  const SubscribeView({Key? key}) : super(key: key);

  static const routeName = "/subscribe";

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
          physics: bouncingScrollPhysics,
          child: Consumer<SubscribeController>(
            builder: (context, subCtrl, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Which of the meals do you want to subscribe for?",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.maxFinite,
                  height: 116.0,
                  child: Wrap(
                    runAlignment: WrapAlignment.spaceBetween,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (final type in mealTypes)
                        OptionRect(
                          onTap: () => subCtrl.setMealType(type),
                          chosen: type == subCtrl.selectedMealType,
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
                    for (final day in Day.values)
                      GestureDetector(
                        onTap: () {
                          if (!subCtrl.daySelected[day]! ||
                              subCtrl.selectedDays.length > 1) {
                            subCtrl.toggleDaySelection(day);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: !subCtrl.daySelected[day]!
                                  ? AppColors.borderAsh
                                  : AppColors.orange,
                            ),
                          ),
                          height: context.width(40),
                          width: context.width(40),
                          child: Text(
                            day.name[0].toUpperCase(),
                            style: GoogleFonts.montserrat(
                              color: !subCtrl.daySelected[day]!
                                  ? AppColors.borderAsh
                                  : AppColors.orange,
                            ),
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
                        onTap: () => subCtrl.setSubscriptionDuration(duration),
                        chosen: duration == subCtrl.subscriptionDuration,
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
                    initialDate: subCtrl.chosenStartDate,
                    firstDate: DateTime.now(),
                    context: context,
                  ).then((date) {
                    if (date != null) subCtrl.setStartDate(date);
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
                          subCtrl.chosenStartDate.toFullString(),
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
                    DeliveryScheduleView.routeName,
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
