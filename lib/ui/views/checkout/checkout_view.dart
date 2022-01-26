import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/checkout/checkout_controller.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/widgets/big_button.dart';
import 'package:foodsub/ui/views/shared/widgets/payment_form_field.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  static const routeName = "/checkout";

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
          child: Consumer<CheckoutController>(
            builder: (context, chkCtrl, child) => Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    physics: bouncingScrollPhysics,
                    child: Form(
                      key: chkCtrl.paymentFormKey,
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
                            focusNode: chkCtrl.focusNodes[0],
                            onChanged: chkCtrl.onHolderChanged,
                            onComplete: chkCtrl.focusNodes[1].requestFocus,
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
                            focusNode: chkCtrl.focusNodes[1],
                            onChanged: chkCtrl.onNumberChanged,
                            onComplete: chkCtrl.focusNodes[2].requestFocus,
                            inputAction: TextInputAction.next,
                            maxLength: 16,
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
                                      hintText: "MM/YY",
                                      focusNode: chkCtrl.focusNodes[2],
                                      onChanged: chkCtrl.onExpiryChanged,
                                      onComplete:
                                          chkCtrl.focusNodes[3].requestFocus,
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
                                      focusNode: chkCtrl.focusNodes[3],
                                      onChanged: chkCtrl.onSecurityChanged,
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
                                value: chkCtrl.shouldSaveDetails,
                                onChanged: chkCtrl.setShouldSaveDetails,
                                activeColor: AppColors.borderAsh,
                                checkColor: AppColors.ash,
                              ),
                              GestureDetector(
                                onTap: () => chkCtrl.setShouldSaveDetails(
                                  !chkCtrl.shouldSaveDetails,
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
                    if (chkCtrl.paymentFormKey.currentState!.validate()) {
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
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
