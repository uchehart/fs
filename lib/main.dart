import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsub/ui/views/cart/cart_view.dart';
import 'package:foodsub/ui/views/checkout/checkout_view.dart';
import 'package:foodsub/ui/views/home/home_screen.dart';
import 'package:foodsub/ui/views/screens/address/delivery_address.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/meal_history.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/screens/sidebar/sidebar.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/startup/onboarding_view.dart';
import 'package:foodsub/ui/views/startup/splash_screen_view.dart';
import 'package:foodsub/ui/views/startup/view_model/onboarding_cubit.dart';
import 'package:foodsub/ui/views/subscription/meal_info_view.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit()),
      ],
      child: MaterialApp(
        initialRoute: "/splashScreen",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            switch (routeSettings.name) {
              case Navigator.defaultRouteName:
                return OnboardingView();
              case HomeScreenView.routeName:
                return const HomeScreenView();
              case SubscribeView.routeName:
                return const SubscribeView();
              case MealInfoView.routeName:
                return const MealInfoView();
              case MealMenuView.routeName:
                return const MealMenuView();
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
