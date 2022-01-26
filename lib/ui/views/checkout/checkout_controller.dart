import 'package:flutter/material.dart';

class CheckoutController with ChangeNotifier {
  final focusNodes = List.generate(4, (index) => FocusNode());
  final paymentFormKey = GlobalKey<FormState>();

  late bool shouldSaveDetails = false;

  late String cardHolderName = "";
  late String cardSecurity = "";
  late String cardExpiry = "";
  late String cardNumber = "";

  void setShouldSaveDetails(bool? shouldSave) {
    shouldSaveDetails = shouldSave ?? false;
    notifyListeners();
  }

  void onSecurityChanged(String security) {
    cardSecurity = security;
    notifyListeners();
  }

  void onNumberChanged(String number) {
    cardNumber = number;
    notifyListeners();
  }

  void onExpiryChanged(String expiry) {
    cardExpiry = expiry;
    notifyListeners();
  }

  void onHolderChanged(String name) {
    cardHolderName = name;
    notifyListeners();
  }
}
