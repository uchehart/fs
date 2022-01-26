import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/utilities/enumerations.dart';

class DeliveryScheduleController with ChangeNotifier {
  late final dayMeals = {
    for (final day in Day.values)
      day: [Meal.samples[Random().nextInt(Meal.samples.length)]],
  };

  void reorderMeals(int oldIndex, int newIndex, Day day) {
    dayMeals[day]!.insert(
      oldIndex >= newIndex ? newIndex : newIndex - 1,
      dayMeals[day]!.removeAt(oldIndex),
    );

    notifyListeners();
  }

  void removeAllMeal(Meal meal, Day day) {
    dayMeals[day] = [...dayMeals[day]!.where((element) => element != meal)];
    notifyListeners();
  }

  void removeMeal(Meal meal, Day day) {
    dayMeals[day]!.remove(meal);
    notifyListeners();
  }

  void addMeal(Meal meal, Day day) {
    dayMeals[day]!.add(meal);
    notifyListeners();
  }
}
