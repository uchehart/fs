import 'package:flutter/material.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/home/home_screen.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/startup/splash_screen_view.dart';
import 'package:foodsub/ui/views/subscription/meal_order_view.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_view.dart';
import 'package:foodsub/ui/views/subscription/subscribe_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        settings: routeSettings,
        builder: (context) {
          switch (routeSettings.name) {
            case Navigator.defaultRouteName:
              return HomeScreenView();
            case MealOrderView.routeName:
              return const MealOrderView();
            case SubscribeView.routeName:
              return const SubscribeView();
            case MealMenuView.routeName:
              return const MealMenuView();
          }

          throw FlutterError("Unknown Route: ${routeSettings.name}");
        },
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          secondary: AppColors.orange,
          primary: AppColors.orange,
        ),
      ),
      // home: SplashScreenView(),
    );
  }
}
