import 'package:flutter/material.dart';
//import 'package:foodsub/app/app.router.dart';
import 'package:foodsub/ui/views/home/home_view.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
//import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Await will be added in future

  runApp(HomeView());
}
