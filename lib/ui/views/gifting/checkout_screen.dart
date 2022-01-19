import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/checkout/checkout_controller.dart';
import 'package:foodsub/ui/views/gifting/receipt_screen.dart';
import 'package:foodsub/ui/views/shared/Widgets/payment_form_field.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/widgets/big_button.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const routeName = "/checkoutScreen";

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
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
              "Checkout",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: AppColors.ash,
                fontSize: 18.0,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    physics: bouncingPhysics,
                    child: Form(
                      key: controller.paymentFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Image.asset("assets/credit_card.png"),
                              ),
                              Positioned(
                                left: 20.0,
                                bottom: 20.0,
                                child: Text(
                                  dummyUserName,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "Payment Method",
                            style: GoogleFonts.montserrat(
                              color: AppColors.ash,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                height: 64.0,
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border:
                                      Border.all(color: AppColors.borderAsh),
                                  color: Colors.white,
                                ),
                                child: Image.asset("assets/visa.png"),
                                width: context.width(72),
                              ),
                              const SizedBox(width: 20.0),
                              Container(
                                height: 64.0,
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(color: AppColors.orange),
                                  color: Colors.white,
                                ),
                                child: Image.asset("assets/mastercard.png"),
                                width: context.width(72),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "Cardholder Name",
                            style: GoogleFonts.montserrat(
                              color: AppColors.ash,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          PaymentFormField(
                            focusNode: controller.focusNodes[0],
                            onChanged: controller.onHolderChanged,
                            onComplete: controller.focusNodes[1].requestFocus,
                            inputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "Card Number",
                            style: GoogleFonts.montserrat(
                              color: AppColors.ash,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          PaymentFormField(
                            focusNode: controller.focusNodes[1],
                            onChanged: controller.onNumberChanged,
                            onComplete: controller.focusNodes[2].requestFocus,
                            inputAction: TextInputAction.next,
                            maxLength: 16,
                            keyBoardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expiry Date",
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.ash,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    PaymentFormField(
                                      keyBoardType: TextInputType.number,
                                      hintText: "MM/YY",
                                      focusNode: controller.focusNodes[2],
                                      onChanged: controller.onExpiryChanged,
                                      onComplete:
                                          controller.focusNodes[3].requestFocus,
                                      inputAction: TextInputAction.next,
                                      maxLength: 5,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CVV",
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.ash,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    PaymentFormField(
                                      keyBoardType: TextInputType.number,
                                      focusNode: controller.focusNodes[3],
                                      onChanged: controller.onSecurityChanged,
                                      inputAction: TextInputAction.done,
                                      maxLength: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: controller.shouldSaveDetails,
                                onChanged: controller.setShouldSaveDetails,
                                activeColor: AppColors.borderAsh,
                                checkColor: AppColors.ash,
                              ),
                              GestureDetector(
                                onTap: () => controller.setShouldSaveDetails(
                                  !controller.shouldSaveDetails,
                                ),
                                child: Text(
                                  "Click to save card details",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.borderAsh,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BigButton(
                  label: "Pay Now",
                  onPressed: () {
                    if (controller.paymentFormKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 96.0),
                              Image.asset("assets/success_banner.png"),
                              const SizedBox(height: 32.0),
                              Text(
                                "Awesome!",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.ash,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(height: 32.0),
                              Text(
                                "You have successfully "
                                "suscribed to Food Sub Africa.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  color: AppColors.ash,
                                ),
                              ),
                              const SizedBox(height: 96.0),
                            ],
                          ),
                        ),
                      ).then((value) => Navigator.pushNamed(
                          context, ReceiptScreen.routeName));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
