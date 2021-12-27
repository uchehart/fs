import 'package:foodsub/ui/views/shared/Widgets/images.dart';
import 'package:foodsub/ui/views/shared/Widgets/meal_list.dart';

final List<MealList> meals = <MealList>[
  const MealList(
      imgPath: breakFast,
      mealName: 'Egg Sauce',
      mealTime: 'Breakfast Time',
      time: '07: 30'),
  const MealList(
      imgPath: launch,
      mealName: 'Jollof Rice',
      mealTime: 'Lunch Time',
      time: '12: 30'),
  const MealList(
      imgPath: drink,
      mealName: 'Smothie',
      mealTime: 'Drink Time',
      time: '14: 30'),
];
