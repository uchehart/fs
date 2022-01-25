import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class GiftMealPill extends StatelessWidget {
  final String selection;
  final int noOfMeals;
  final String price;
  final bool? isSelected;
  final int value;
  final int groupValue;
  final ValueChanged? onPressed;

  const GiftMealPill({
    Key? key,
    required this.selection,
    required this.noOfMeals,
    required this.price,
    this.isSelected,
    required this.groupValue,
    required this.value,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(right: 16),
      decoration: isSelected!
          ? BoxDecoration(
              border: Border.all(
                color: AppColors.orange,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ))
          : BoxDecoration(
              border: Border.all(
                color: AppColors.ash,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              )),
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.orange,
            value: value,
            groupValue: groupValue,
            onChanged: onPressed,
          ),
          Text(
            selection,
            style: AppTextStyles.subtitle,
          ),
          const Spacer(),
          const Icon(
            CupertinoIcons.ellipsis_vertical,
            size: 13,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                price,
                style: AppTextStyles.subtitle,
              ),
              Text(
                "$noOfMeals meals",
                style: AppTextStyles.smallText.copyWith(fontSize: 9),
              ),
            ],
          )
        ],
      ),
    );
  }
}
