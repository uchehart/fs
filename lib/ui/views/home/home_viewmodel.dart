import 'package:foodsub/app/app.router.dart';
import 'package:stacked/stacked.dart';
//import 'package:foodsub/app/app.dart';
import '../../../app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String _declaration = 'Stacked is cool';
  String get myDeclaration => _declaration;

  void updateCounter() {
    _declaration = 'I say Stacked is sooo cool';
    notifyListeners();
  }

  final _navigationService = locator<NavigationService>();

  void navigateToProfileView() {
    _navigationService.navigateTo(Routes.profileView);
  }
}
