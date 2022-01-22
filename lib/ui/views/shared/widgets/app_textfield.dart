import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final bool? filled;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxlength;
  final InputBorder? border;
  final String? title;
  final String? label;
  final int? maxLines;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final bool? enabled;
  final Widget? input;
  final Function(String?)? onSaved;
  final String? intial;

  const AppTextField(
      {Key? key,
      this.label,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.onChanged,
      this.maxLines,
      this.obscureText,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.borderColor,
      this.textColor = Colors.black87,
      this.filled,
      this.input,
      this.maxlength,
      this.border,
      this.title,
      this.height,
      this.enabled,
      this.onSaved,
      this.intial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label!.toUpperCase()) : const SizedBox(),
//        label != null ? const SizedBox(height: 6) : SizedBox(),
        Text(
          title!,
          style: AppTextStyles.subtitle.copyWith(
            fontWeight: FontWeight.w400,
            height: height,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: intial,
          onSaved: onSaved,
          controller: controller,
          style: AppTextStyles.heading3.copyWith(
            fontSize: 18,
            height: height,
          ),
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          validator: validator,
          keyboardType: keyboardType,
          enabled: enabled,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(16.0),
            border: const OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? const Color(0xFFE4ECF1), width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppColors.orange),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
