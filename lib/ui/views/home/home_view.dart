import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Stacked setup'),
                  // Text(model.myDeclaration),
                  // TextButton(
                  //   onPressed: () => model.updateCounter(),
                  //   child: const Text('Update Text'),
                  // ),
                  TextButton(
                    onPressed: () => model.navigateToProfileView(),
                    child: const Text('Go To Profile View'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
