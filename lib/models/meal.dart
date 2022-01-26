import 'package:flutter/material.dart';
import 'package:foodsub/models/addition.dart';
import 'package:foodsub/utilities/constants.dart';

class Meal {
  final String name;
  final String thumb;
  final String image;
  final String description;
  final ValueNotifier<bool> hearted;
  final ValueNotifier<String> attribute;
  final ValueNotifier<String> preference;
  final ValueNotifier<List<Addition>> additions;
  final List<List<String>> values;
  final List<String> ingredients;
  final double rating;
  final double price;
  final int cals;
  final int revs;

  Meal({
    required this.name,
    required this.thumb,
    required this.image,
    required this.price,
    required this.values,
    required this.hearted,
    required this.attribute,
    required this.additions,
    required this.preference,
    required this.description,
    required this.ingredients,
    this.rating = 1.0,
    this.cals = 0,
    this.revs = 0,
  });

  static final samples = [
    Meal(
      name: "Fried Rice",
      thumb: "assets/fried_rice_meal.png",
      additions: ValueNotifier([...Addition.samples]),
      preference: ValueNotifier(dummyPreferences[0]),
      attribute: ValueNotifier(mealAttributes[0]),
      values: dummyNutritionalValues,
      hearted: ValueNotifier(false),
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
      additions: ValueNotifier([...Addition.samples]),
      preference: ValueNotifier(dummyPreferences[0]),
      attribute: ValueNotifier(mealAttributes[0]),
      values: dummyNutritionalValues,
      hearted: ValueNotifier(false),
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
      additions: ValueNotifier([...Addition.samples]),
      preference: ValueNotifier(dummyPreferences[0]),
      attribute: ValueNotifier(mealAttributes[0]),
      values: dummyNutritionalValues,
      hearted: ValueNotifier(false),
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
      additions: ValueNotifier([...Addition.samples]),
      preference: ValueNotifier(dummyPreferences[0]),
      attribute: ValueNotifier(mealAttributes[0]),
      values: dummyNutritionalValues,
      hearted: ValueNotifier(false),
      description: dummyDescription,
      ingredients: dummyIngredients,
      image: dummyBigImage,
      price: 750.00,
      rating: 0.0,
      cals: 353,
      revs: 0,
    ),
  ];
}
