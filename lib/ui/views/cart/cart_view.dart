import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/checkout/checkout_view.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/widgets/big_button.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_controller.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final days = context.select(
      (SubscribeController ctrl) => ctrl.selectedDays,
    );

    final dayMeals = context.select(
      (DeliveryScheduleController ctrl) => ctrl.dayMeals,
    );

    final allSelectedMeals = [...days.expand((day) => dayMeals[day]!)];

    final uniqueSelectedMeals = [
      ...{...allSelectedMeals}
    ];

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
            "My Cart",
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
                onPressed: () => Navigator.pop(context),
                icon: Text(
                  "Edit",
                  style: GoogleFonts.montserrat(color: AppColors.orange),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: bouncingScrollPhysics,
                padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 20.0),
                itemCount: uniqueSelectedMeals.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24.0),
                itemBuilder: (context, index) {
                  final meal = uniqueSelectedMeals[index];
                  return Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: boxShadow,
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          meal.thumb,
                          height: context.width(64),
                          width: context.width(64),
                        ),
                        context.widthBox(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              meal.name,
                              style: GoogleFonts.montserrat(
                                color: AppColors.ash,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              days
                                  .where((day) => dayMeals[day]!.contains(meal))
                                  .map(
                                    (day) =>
                                        day.name.toNameCase().substring(0, 3),
                                  )
                                  .join(", "),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ash,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFFFDDEAF),
                        ),
                        child: Consumer<SubscribeController>(
                          builder: (context, subCtrl, child) => ListView(
                            physics: bouncingScrollPhysics,
                            shrinkWrap: true,
                            children: [
                              _getSummaryRow(
                                "Number Of Meals",
                                "${allSelectedMeals.length}",
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Delivery Days",
                                days
                                    .map(
                                      (day) =>
                                          day.name.toNameCase().substring(0, 3),
                                    )
                                    .join(", "),
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Plan",
                                subCtrl.subscriptionDuration,
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Start Date",
                                subCtrl.chosenStartDate.toFullString(),
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Total Price",
                                "₦ " +
                                    NumberFormat.decimalPattern().format(
                                      allSelectedMeals.fold<double>(
                                        0.0,
                                        (total, meal) => total + meal.price,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    BigButton(
                      label: "Check Out",
                      onPressed: () => Navigator.pushNamed(
                        context,
                        CheckoutView.routeName,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _getSummaryRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            left,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: AppColors.ash,
              fontSize: 12.0,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            right,
            textAlign: TextAlign.end,
            style: GoogleFonts.montserrat(
              color: AppColors.ash,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
