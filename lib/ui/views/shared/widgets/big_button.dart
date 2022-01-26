import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BigButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const BigButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.orange,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.orange),
        borderRadius: BorderRadius.circular(8.0),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      textColor: Colors.white,
      child: Text(
        label,
        style: GoogleFonts.montserrat(fontSize: 18.0),
      ),
      minWidth: double.maxFinite,
      height: 52.0,
    );
  }
}
