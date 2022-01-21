import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/sidebar/sidebar_top.dart';
import 'package:foodsub/ui/views/shared/colors.dart';

import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);
  static const routeName = "/sidebar";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Column(children: [
          const SideBarTop(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DummyScreens.routeName,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.article_outlined,
              ),
              title: Text(
                'Meal Plan',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DummyScreens.routeName,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.redeem_outlined,
              ),
              title: Text(
                'Offers and Promo',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DummyScreens.routeName,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.home_outlined,
              ),
              title: Text(
                'Delivery Address',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DummyScreens.routeName,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.favorite_border_outlined,
              ),
              title: Text(
                'Favorites',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DummyScreens.routeName,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.settings_outlined,
              ),
              title: Text(
                'Settings',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DummyScreens.routeName,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.help_outline_outlined,
              ),
              title: Text(
                'Help & Support',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Navigator.defaultRouteName,
              );
            },
            child: ListTile(
              leading: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: const Icon(
                  Icons.logout_outlined,
                ),
              ),
              title: Text(
                'Log Out',
                style: GoogleFonts.montserrat(
                  color: AppColors.ash,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class DummyScreens extends StatelessWidget {
  final String? text;
  const DummyScreens({Key? key, this.text}) : super(key: key);
  static const routeName = "/sidedummy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(text!),
    ));
  }
}
