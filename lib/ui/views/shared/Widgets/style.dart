import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle heading1 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 28,
  );

  static TextStyle heading2 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 24,
  );

  static TextStyle heading3 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 18,
  );

  static TextStyle subtitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 16,
  );

  static TextStyle smallSubtitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 14,
  );

  static TextStyle smallText = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 12,
  );
}
