import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/startup/splash_screen_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreenView(),
    );
  }
}
