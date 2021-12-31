import 'package:flutter/material.dart';

// Subscription
const mealTypes = ["All", "Breakfast", "Lunch", "Dinner"];
const mealAttributes = ["Description", "Ingredients", "Nutritional Values"];
const deliveryIntervals = ["Daily", "Triweekly", "Weekends"];
const subscriptionDurations = ["One Week", "One Month"];

// Widgets
const emptyInputBorder = OutlineInputBorder(borderSide: BorderSide.none);
const bouncingPhysics = BouncingScrollPhysics();
const boxShadow = [
  BoxShadow(
    color: Color.fromRGBO(201, 201, 201, 0.18),
    offset: Offset(0.0, 8.0),
    blurRadius: 20.0,
  ),
];

// Sizes
const modelWidth = 411.42857;
const modelHeight = 843.42857;

// Dummy
const dummyUserName= "Uche";

const dummyBigImage = "assets/jollof_rice_meal_large.png";

const dummyDescription =
    "Fried rice is a dish of cooked rice that is stir-fried in a "
    "frying pan and is usually mixed with other ingredients "
    "such as vegetables, seafood or meat.";

const dummyNumberOfMealsLeft = 4;

const dummyNutritionalValues = [
  [
    "Carbohydrates",
    "2.6g",
  ],
  [
    "Protein",
    "15.5g",
  ],
  [
    "Sodium",
    "18% *",
  ],
  [
    "Potassium",
    "5% *",
  ],
  [
    "Vitamins A, B3 & C",
    "",
  ],
];

const dummyPreferences = [
  "Preference 1",
  "Preference 2",
  "Preference 3",
  "Preference 4",
];

const dummyIngredients = [
  "Rice",
  "Onions",
  "Carrots",
  "Curry Powder",
  "Greep Pepper",
  "Chicken Stock",
  "Groundnut Oil",
  "Seasoning",
];
