import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/gifting/model/gift_pill_item.dart';

class GiftingViewModel extends ChangeNotifier {
  static GiftingViewModel get instance => _instance ??= GiftingViewModel();

  static GiftingViewModel? _instance;

  //getter
  List<GiftPillItem> get meal => _meal;

  late int rval = 0;
  void onChange(val) {
    rval = val;
    notifyListeners();
  }

  late bool selected = false;
  late int rval1 = 0;
  void onChange1(val) {
    rval1 = val;
    notifyListeners();
    // selected = !selected;
  }

  final List<GiftPillItem> _meal = [
    GiftPillItem(
      selection: "Weekly",
      noOfMeals: 5,
      price: "#5,000",
    ),
    GiftPillItem(
      selection: "Monthly",
      noOfMeals: 5,
      price: "#5,000",
    ),
  ];
}
