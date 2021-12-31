import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/cart/cart_controller.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/subscription/shared/big_button.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final root = SubscribeController.instance;
    final controller = CartController.instance;
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
                  physics: bouncingPhysics,
                  padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 20.0),
                  itemCount: controller.meals.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24.0),
                  itemBuilder: (context, index) {
                    final meal = controller.meals[index];
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                meal.name,
                                style: GoogleFonts.montserrat(
                                  color: AppColors.ash,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: meal.count > 1
                                        ? () =>
                                            controller.decrementServings(meal)
                                        : null,
                                    icon: Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: const BoxDecoration(
                                        color: AppColors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${meal.count}",
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.ash,
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: meal.count < 10
                                        ? () =>
                                            controller.incrementServings(meal)
                                        : null,
                                    icon: Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: const BoxDecoration(
                                        color: AppColors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
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
                          child: ListView(
                            physics: bouncingPhysics,
                            shrinkWrap: true,
                            children: [
                              _getSummaryRow(
                                "Meals",
                                controller.meals
                                    .map((meal) => meal.name)
                                    .join(", "),
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Frequency",
                                root.selectedDeliveryInterval,
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Preferred Days",
                                root.selectedDays
                                    .map((day) =>
                                        day.name.toNameCase().substring(0, 3))
                                    .join(", "),
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Subscription Duration",
                                root.selectedSubscriptionDuration,
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Start Date",
                                DateFormat("MMMM d, y")
                                    .format(root.selectedStartDate),
                              ),
                              const SizedBox(height: 16.0),
                              _getSummaryRow(
                                "Price",
                                "₦ 20,000 / ${root.selectedSubscriptionDuration}",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      BigButton(
                        label: "Check Out",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
