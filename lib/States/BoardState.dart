import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Mission.dart';

class BoardState with ChangeNotifier {
  int id = 1;
  String title = '';
  String start_at = '';
  String end_at = '';
  List<Mission> missions = [];
  int? achievement;

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
}
