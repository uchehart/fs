import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Color textColor;
  final bool isLoading;
  final String? label;
  final EdgeInsets padding;

  const AppButton({
    Key? key,
    this.onPressed,
    this.color,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading ? null : onPressed,
      color: AppColors.orange,
      textColor: AppColors.white,
      padding: padding,
      child: Text(
        label!,
        style: const TextStyle(fontSize: 14),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.orange)),
    );
  }
}
