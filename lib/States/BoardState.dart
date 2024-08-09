import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Mission.dart';

class BoardState with ChangeNotifier {
  String document_id = '';
  String boardNm = '여기를 클릭해보세요!';
  int startAt = 0;
  int endAt = 0;
  List<Mission> missions = [];
  // int? achievement;
  int? del_dt;
  bool? del_yn;
  int? reg_dt;
  int? mod_dt;
  int dailyGoal = 0;
  double totalPercentage = 0.0;

  changeBoardId(String _val) {
    document_id = _val;
    notifyListeners();
  }

  changeBoardName(String _val) {
    boardNm = _val;
    notifyListeners();
  }

  changeBoardStartAt(int _val) {
    startAt = _val;
    notifyListeners();
  }

  changeBoardEndAt(int _val) {
    endAt = _val;
    notifyListeners();
  }

  changeMissions(List<Mission> _val) {
    missions = _val;
    notifyListeners();
  }

  // changeBoardAchievement(int _val) {
  //   achievement = _val;
  //   notifyListeners();
  // }

  changeBoardRegDt(int _val) {
    reg_dt = _val;
    notifyListeners();
  }

  changeBoardModDt(int _val) {
    mod_dt = _val;
    notifyListeners();
  }

  changeBoardDelDt(int _val) {
    del_dt = _val;
    notifyListeners();
  }

  changeBoardDelYn(bool _val) {
    del_yn = _val;
    notifyListeners();
  }

  changeBoardDailyGoal(int _val) {
    dailyGoal = _val;
    notifyListeners();
  }

  changeBoardTotalPercentage(double _val) {
    totalPercentage = _val;
    notifyListeners();
  }
}
