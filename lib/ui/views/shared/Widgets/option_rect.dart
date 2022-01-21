import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionRect extends StatelessWidget {
  final GestureTapCallback onTap;
  final String label;
  final double width;
  final bool chosen;

  const OptionRect({
    Key? key,
    required this.label,
    required this.width,
    required this.onTap,
    this.chosen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: chosen ? AppColors.orange : AppColors.borderAsh,
          ),
        ),
        height: 48.0,
        width: width,
        child: Text(
          label,
          style: GoogleFonts.montserrat(color: AppColors.ash),
        ),
      ),
      onTap: onTap,
    );
  }
}
