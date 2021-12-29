// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/nav_bar.dart';
import 'package:foodsub/ui/views/subscription/subscribe_view.dart';

class HomeScreenView extends StatefulWidget {
  static const routeName = "/home";
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final List<Widget> _children = [
    Center(child: SubscribeView()), //Home widget should be placed here
    Center(child: Text("Histoy")), //History widget should be placed here
    Center(child: Text("Cart")), //Cart widget should be placed here
    Center(child: Text("Profile")), //Profile widget should be placed here
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void onTabSelected(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentPage],
      bottomNavigationBar: NavBar(
        backgroundColor: Colors.white,
        color: Colors.grey,
        selectedColor: AppColors.orange,
        onTabSelected: onTabSelected,
        items: [
          NavBarItem(img: Icons.home_outlined, iconText: 'Home'),
          NavBarItem(img: Icons.history, iconText: 'History'),
          NavBarItem(img: Icons.shopping_cart, iconText: 'Cart'),
          NavBarItem(img: Icons.person_outline, iconText: 'Profile'),
        ],
      ),
    );
  }
}
