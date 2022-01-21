import 'package:flutter/cupertino.dart';
import 'package:foodsub/ui/views/gifting/model/gift_pill_item.dart';

class GiftingViewModel extends ChangeNotifier {
  bool? _selected = false;

  int _groupVal = 0;

  int rval = 0;
  //getter
  List<GiftPillItem> get meal => _meal;
  bool? get selected => _selected;
  int get groupVal => _groupVal;

  void isSelected() {
    _selected = !_selected!;
    notifyListeners();
  }

  void onChanged(val) {
    // _selected = val;
    _groupVal = val;
    print(val);
    print(_groupVal);
    notifyListeners();
  }

  final List<GiftPillItem> _meal = [
    GiftPillItem(
      selection: "Weekly",
      noOfMeals: 5,
      price: "#5,000",
    ),
    GiftPillItem(
      selection: "Monthly",
      noOfMeals: 5,
      price: "#5,000",
    ),
  ];
}
