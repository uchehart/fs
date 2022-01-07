import 'package:flutter/material.dart';

enum NotifierState { isLoading, isIdle }

class Notifier extends ChangeNotifier {
  NotifierState _state = NotifierState.isIdle;

  NotifierState get state => _state;

  void setState(NotifierState state) {
    _state = state;
    super.notifyListeners();
  }
}
