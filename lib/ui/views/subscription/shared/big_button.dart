import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BigButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String label;

  const BigButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.orange,
        ),
        height: 52.0,
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
