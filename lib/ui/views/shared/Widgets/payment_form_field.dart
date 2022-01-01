import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentFormField extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction? inputAction;
  final VoidCallback? onComplete;
  final FocusNode? focusNode;
  final String? hintText;
  final int? maxLength;

  const PaymentFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.focusNode,
    this.onComplete,
    this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.borderAsh),
        color: Colors.white,
      ),
      height: 52.0,
      child: TextFormField(
        onChanged: onChanged,
        focusNode: focusNode,
        maxLength: maxLength,
        validator: validator,
        cursorColor: AppColors.ash,
        textInputAction: inputAction,
        onEditingComplete: onComplete,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) =>
            null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: emptyInputBorder,
          focusedBorder: emptyInputBorder,
          hintStyle: GoogleFonts.montserrat(
            color: AppColors.borderAsh,
            fontSize: 16.0,
          ),
          hintText: hintText,
        ),
        style: GoogleFonts.montserrat(
          color: AppColors.ash,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
