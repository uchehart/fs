import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardController with ChangeNotifier {
  static DashboardController get instance =>
      _instance ??= DashboardController();

  static DashboardController? _instance;

  final deliveryImages = [
    "assets/smoothie_delivery.png",
    "assets/stew_delivery.png",
    "assets/chops_delivery.png",
  ];

  final actions = [
    "Subscribe for a meal",
    "Gift a meal",
    "Pay for me",
    "Pause / Resume a subscription",
  ];

  final icons = [
    Icons.credit_card,
    Icons.card_giftcard,
    CupertinoIcons.creditcard,
    CupertinoIcons.pause,
  ];
}
