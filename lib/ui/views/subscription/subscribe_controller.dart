import 'package:flutter/material.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/enumerations.dart';

class SubscribeController with ChangeNotifier {
  late final daySelected = {for (final day in Day.values) day: true};

  late DateTime chosenStartDate = DateTime.now();
  late String subscriptionDuration = subscriptionDurations[0];
  late String selectedMealType = mealTypes[0];

  List<Day> get selectedDays {
    return [...Day.values.where((day) => daySelected[day]!)];
  }

  void setSubscriptionDuration(String duration) {
    subscriptionDuration = duration;
    notifyListeners();
  }

  void toggleDaySelection(Day day) {
    daySelected[day] = !daySelected[day]!;
    notifyListeners();
  }

  void setStartDate(DateTime date) {
    chosenStartDate = date;
    notifyListeners();
  }

  void setMealType(String type) {
    selectedMealType = type;
    notifyListeners();
  }
}
