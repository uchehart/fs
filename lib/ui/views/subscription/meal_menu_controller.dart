import 'package:flutter/material.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/utilities/constants.dart';

class MealMenuController with ChangeNotifier {
  static MealMenuController get instance => _instance ??= MealMenuController();

  static MealMenuController? _instance;

  late List<Meal> availableMeals = [
    Meal(
      name: "Fried Rice",
      thumb: "assets/fried_rice_meal.png",
      nutritionalValues: dummyNutritionalValues,
      description: dummyDescription,
      ingredients: dummyIngredients,
      image: dummyBigImage,
      price: 1500.00,
      rating: 4.8,
      cals: 353,
      revs: 20,
    ),
    Meal(
      name: "Jollof Rice",
      thumb: "assets/jollof_rice_meal.png",
      nutritionalValues: dummyNutritionalValues,
      description: dummyDescription,
      ingredients: dummyIngredients,
      image: dummyBigImage,
      price: 1350.00,
      rating: 4.0,
      cals: 353,
      revs: 16,
    ),
    Meal(
      name: "Noodles",
      thumb: "assets/noodles_meal.png",
      nutritionalValues: dummyNutritionalValues,
      description: dummyDescription,
      ingredients: dummyIngredients,
      image: dummyBigImage,
      price: 800.00,
      rating: 2.4,
      cals: 353,
      revs: 8,
    ),
    Meal(
      name: "Pancake",
      thumb: "assets/pancake_meal.png",
      nutritionalValues: dummyNutritionalValues,
      description: dummyDescription,
      ingredients: dummyIngredients,
      image: dummyBigImage,
      price: 750.00,
      rating: 0.0,
      cals: 353,
      revs: 0,
    ),
  ];

  String get selectedMealType => SubscribeController.instance.selectedMealType;

  List<Meal> get selectedMeals =>
      [...availableMeals.where((meal) => meal.selected)];

  late Meal queriedMeal;

  void toggleSelected(Meal meal) {
    meal.selected = !meal.selected;
    notifyListeners();
  }

  void toggleHearted(Meal meal) {
    meal.hearted = !meal.hearted;
    notifyListeners();
  }

  void setMealType(String type) {
    SubscribeController.instance.setMealType(type);
    notifyListeners();
  }
}
