import 'package:flutter/material.dart';

enum NavigationStateEnum { none, auth, home }

class NavigationState with ChangeNotifier {
  NavigationStateEnum state = NavigationStateEnum.none;

  changeState(NavigationStateEnum _state) {
    state = _state;
    notifyListeners();
  }
}
