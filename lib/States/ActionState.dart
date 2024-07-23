import 'package:flutter/material.dart';

class ActionState with ChangeNotifier {
  int id = 1;
  String title = '';
  int mission_id = 0;
  String cycle = '';
  int goal_unit = 0;
  int action_unit = 0;
  String unit_name = '';
  int? achievement;

  changeActionId(int _val) {
    id = _val;
    notifyListeners();
  }

  changeActionTitle(String _val) {
    title = _val;
    notifyListeners();
  }

  changeMissionId(int _val) {
    mission_id = _val;
    notifyListeners();
  }

  changeGoalUnit(String _val) {
    cycle = _val;
    notifyListeners();
  }

  changeActionUnit(int _val) {
    goal_unit = _val;
    notifyListeners();
  }

  changeActionAchievement(int _val) {
    action_unit = _val;
    notifyListeners();
  }
}
