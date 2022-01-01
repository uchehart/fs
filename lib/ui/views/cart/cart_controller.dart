import 'package:flutter/material.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_controller.dart';

class CartController with ChangeNotifier {
  static CartController get instance => _instance ??= CartController();
  static CartController? _instance;

  List<Meal> get meals => MealMenuController.instance.selectedMeals;

  void incrementServings(Meal meal) {
    meal.count++;
    notifyListeners();
  }

  void decrementServings(Meal meal) {
    meal.count--;
    notifyListeners();
  }
}
