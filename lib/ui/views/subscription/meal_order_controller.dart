import 'package:flutter/material.dart';
import 'package:foodsub/models/addition.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_controller.dart';
import 'package:foodsub/utilities/constants.dart';

class MealOrderController with ChangeNotifier {
  static MealOrderController get instance =>
      _instance ??= MealOrderController();

  static MealOrderController? _instance;

  late List<Addition> availableAdditions = [
    Addition(
      image: "assets/chicken_addition.png",
      name: "Chicken",
    ),
    Addition(
      image: "assets/beef_addition.png",
      name: "Beef",
    ),
    Addition(
      image: "assets/fish_addition.png",
      name: "Fish",
    ),
  ];

  List<Addition> get addedAdditions =>
      [...availableAdditions.where((addition) => addition.added)];

  Meal get meal => MealMenuController.instance.selectedMeal;

  late String preference = dummyPreferences[0];
  late String showingAttr = mealAttributes[0];
  late int numberOfServings = 1;

  late PageController pager;

  void incrementServings() {
    numberOfServings++;
    notifyListeners();
  }

  void decrementServings() {
    numberOfServings--;
    notifyListeners();
  }

  void toggleAddition(Addition addition) {
    addition.added = !addition.added;
    notifyListeners();
  }

  void setShowingAttr(int index) {
    showingAttr = mealAttributes[index];
    notifyListeners();
  }

  void setPagerIndex(int index) {
    setShowingAttr(index);
    pager.animateToPage(
      index,
      duration: const Duration(milliseconds: 512),
      curve: Curves.linear,
    );
    notifyListeners();
  }

  void setPreference(String? pref) {
    preference = pref!;
    notifyListeners();
  }
}
