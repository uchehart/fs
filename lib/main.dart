import 'package:flutter/material.dart';
import 'package:foodsub/models/meal.dart';
import 'package:foodsub/ui/views/cart/cart_view.dart';
import 'package:foodsub/ui/views/checkout/checkout_controller.dart';
import 'package:foodsub/ui/views/checkout/checkout_view.dart';
import 'package:foodsub/ui/views/dashboard/dashboard_controller.dart';
import 'package:foodsub/ui/views/gifting/checkout_screen.dart';
import 'package:foodsub/ui/views/gifting/gift_a_meal_screen.dart';
import 'package:foodsub/ui/views/gifting/receipt_screen.dart';
import 'package:foodsub/ui/views/gifting/receiver_detail_screen.dart';
import 'package:foodsub/ui/views/gifting/redeem_meal_screen.dart';
import 'package:foodsub/ui/views/gifting/view_meal_plan_screen.dart';
import 'package:foodsub/ui/views/home/home_screen.dart';
import 'package:foodsub/ui/views/screens/address/delivery_address.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/meal_history.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/screens/sidebar/sidebar.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/startup/onboarding_view.dart';
import 'package:foodsub/ui/views/startup/splash_screen_view.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_controller.dart';
import 'package:foodsub/ui/views/subscription/delivery_schedule_view.dart';
import 'package:foodsub/ui/views/subscription/meal_info_view.dart';
import 'package:foodsub/ui/views/subscription/meal_menu_view.dart';
import 'package:foodsub/ui/views/subscription/subscribe_controller.dart';
import 'package:foodsub/ui/views/subscription/subscribe_view.dart';
import 'package:foodsub/utilities/enumerations.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeliveryScheduleController()),
        ChangeNotifierProvider(create: (_) => SubscribeController()),
        ChangeNotifierProvider(create: (_) => CheckoutController()),
        Provider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        // initialRoute: "/splashScreen",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            switch (routeSettings.name) {
              case Navigator.defaultRouteName:
                return OnboardingView();
              case DeliveryScheduleView.routeName:
                return const DeliveryScheduleView();
              case HomeScreenView.routeName:
                return const HomeScreenView();
              case SubscribeView.routeName:
                return const SubscribeView();
              case MealInfoView.routeName:
                return MealInfoView(
                  meal: (routeSettings.arguments as List)[0] as Meal,
                  day: (routeSettings.arguments as List)[1] as Day,
                );
              case MealMenuView.routeName:
                return MealMenuView(day: routeSettings.arguments as Day);
              case CheckoutView.routeName:
                return const CheckoutView();
              case CartView.routeName:
                return const CartView();
              case SplashScreenView.routeName:
                return const SplashScreenView();
              case DeliveryAddress.routeName:
                return const DeliveryAddress();
              case NotificationScreen.routeName:
                return const NotificationScreen();
              case SideBar.routeName:
                return const SideBar();
              case MealHistory.routeName:
                return const MealHistory();
              case GiftAMealScreen.routeName:
                return const GiftAMealScreen();
              case ReceiverDetailScreen.routeName:
                return const ReceiverDetailScreen();
              case CheckoutScreen.routeName:
                return const CheckoutScreen();
              case ReceiptScreen.routeName:
                return const ReceiptScreen();
              case RedeemMealScreen.routeName:
                return const RedeemMealScreen();
              case ViewMealPlanScreen.routeName:
                return const ViewMealPlanScreen();
              case DummyScreens.routeName:
                return const DummyScreens(
                  text: 'Dummy Screen',
                );
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
      ),
    );
  }
}
