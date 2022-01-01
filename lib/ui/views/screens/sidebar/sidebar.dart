import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodsub/ui/views/screens/sidebar/sidebar_top.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

import 'dart:math' as math;

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SideBarTop(),
        ListTile(
          leading: const Icon(
            Icons.article_outlined,
            size: 19,
          ),
          title: Text(
            'Meal Plan',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.redeem_outlined,
            size: 19,
          ),
          title: Text(
            'Offers and Promo',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home_outlined,
            size: 19,
          ),
          title: Text(
            'Delivery Address',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite_border_outlined,
            size: 19,
          ),
          title: Text(
            'Favorites',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.settings_outlined,
            size: 19,
          ),
          title: Text(
            'Settings',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.help_outline_outlined,
            size: 19,
          ),
          title: Text(
            'Help & Support',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
        const Spacer(),
        ListTile(
          leading: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const Icon(
              Icons.logout_outlined,
              size: 19,
            ),
          ),
          title: Text(
            'Log Out',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w100),
          ),
        ),
      ]),
    );
  }
}
