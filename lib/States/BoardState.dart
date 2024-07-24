import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Mission.dart';

class BoardState with ChangeNotifier {
  int id = 1;
  String title = '여기를 클릭해보세요!';
  String start_at = '';
  String end_at = '';
  List<Mission> missions = [];
  int? achievement;
  DateTime deleted = DateTime.now();
  DateTime created = DateTime.now();
  DateTime modified = DateTime.now();
  int daily_goal = 0;
  double total_percentage = 0.0;

  changeBoardId(int _val) {
    id = _val;
    notifyListeners();
  }

  changeBoardTitle(String _val) {
    title = _val;
    notifyListeners();
  }

  changeBoardStartAt(String _val) {
    start_at = _val;
    notifyListeners();
  }

  changeBoardEndAt(String _val) {
    end_at = _val;
    notifyListeners();
  }

  changeMissions(List<Mission> _val) {
    missions = _val;
    notifyListeners();
  }

  changeBoardAchievement(int _val) {
    achievement = _val;
    notifyListeners();
  }

  changeBoardCreated(DateTime _val) {
    created = _val;
    notifyListeners();
  }

  changeBoardModified(DateTime _val) {
    modified = _val;
    notifyListeners();
  }

  changeBoardDeleted(DateTime _val) {
    deleted = _val;
    notifyListeners();
  }

  changeBoardDailyGoal(int _val) {
    daily_goal = _val;
    notifyListeners();
  }

  changeBoardTotalPercentage(double _val) {
    total_percentage = _val;
    notifyListeners();
  }
}
