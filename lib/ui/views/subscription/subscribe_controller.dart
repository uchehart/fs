import 'package:flutter/material.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enums.dart';

class SubscribeController with ChangeNotifier {
  static SubscribeController get instance =>
      _instance ??= SubscribeController();

  static SubscribeController? _instance;

  late DateTime selectedStartDate = DateTime.now();
  late List<Day> selectedDays = [...Day.values.take(3)];
  late String selectedSubscriptionDuration = subscriptionDurations[0];
  late String selectedDeliveryInterval = deliveryIntervals[1];
  late String selectedMealType = mealTypes[0];

  void setSubscriptionDuration(String duration) {
    selectedSubscriptionDuration = duration;
    notifyListeners();
  }

  void setDeliveryInterval(String interval) {
    selectedDeliveryInterval = interval;

    selectedDays = interval == deliveryIntervals[1]
        ? [...Day.values.take(3)]
        : interval == deliveryIntervals[2]
            ? [...Day.values.skip(5)]
            : Day.values;

    notifyListeners();
  }

  void setStartDate(DateTime date) {
    selectedStartDate = date;
    notifyListeners();
  }

  void setMealType(String type) {
    selectedMealType = type;
    notifyListeners();
  }
}
