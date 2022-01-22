// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingColumn extends StatelessWidget {
  final String? imgPath;
  final String? titletext;
  final String? subtitleText;

  const OnboardingColumn({
    Key? key,
    this.imgPath,
    this.titletext,
    this.subtitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            imgPath!,
            height: MediaQuery.of(context).size.height / 3,
          ),
          const SizedBox(height: 24),
          Text(
            titletext!,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
//          const SizedBox(height: 18),
          Text(
            subtitleText!,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              height: 2,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
//          const Spacer(),
        ],
      ),
    );
  }
}
