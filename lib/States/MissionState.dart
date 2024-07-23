import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/ActionItem.dart';

class MissionState with ChangeNotifier {
  int id = 0;
  String title = '';
  List<ActionItem> actions = [];

  changeActionId(int _val) {
    id = _val;
    notifyListeners();
  }

  changeActionTitle(String _val) {
    title = _val;
    notifyListeners();
  }

  changeActions(List<ActionItem> _val) {
    actions = _val;
    notifyListeners();
  }
}
