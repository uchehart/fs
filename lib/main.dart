import 'package:flutter/material.dart';
//import 'package:foodsub/app/app.router.dart';
import 'package:foodsub/ui/views/home/home_view.dart';
//import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Await will be added in future
  // ignore: prefer_const_constructors
  runApp(HomeView());
}
