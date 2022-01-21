// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/dashboard/dashboard_view.dart';
import 'package:foodsub/ui/views/gifting/gifting_screen.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/meal_history.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/widgets/nav_bar.dart';

class HomeScreenView extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final List<Widget> _children = [
    Center(child: DashboardView()), //Home widget should be placed here
    Center(child: MealHistory()), //History widget should be placed here
    Center(child: GiftingScreen()), //Cart widget should be placed here
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
          NavBarItem(img: Icons.shopping_cart, iconText: 'Gifting'),
          NavBarItem(img: Icons.person_outline, iconText: 'Profile'),
        ],
      ),
    );
  }
}
