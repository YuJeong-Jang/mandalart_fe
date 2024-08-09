import 'package:flutter/material.dart';

class ActionState with ChangeNotifier {
  String document_id = '';
  String? actionNm;
  String mission_doc_id = '';
  String board_doc_id = '';
  String cycle = '매일';
  int goal_unit = 0;
  int? action_unit;
  String unit = '회';
  int? achievement;
  int? del_dt;
  bool? del_yn;
  int? reg_dt;
  int? mod_dt;

  changeActionId(String _val) {
    document_id = _val;
    notifyListeners();
  }

  changeActionName(String _val) {
    actionNm = _val;
    notifyListeners();
  }

  changeMissionDocId(String _val) {
    mission_doc_id = _val;
    notifyListeners();
  }

  changeBoardDocId(String _val) {
    board_doc_id = _val;
    notifyListeners();
  }

  changeGoalUnit(int _val) {
    goal_unit = _val;
    notifyListeners();
  }

  changeActionUnit(int _val) {
    action_unit = _val;
    notifyListeners();
  }

  changeUnit(String _val) {
    unit = _val;
    notifyListeners();
  }

  changeCycle(String _val) {
    cycle = _val;
    notifyListeners();
  }

  changeActionAchievement(int _val) {
    achievement = _val;
    notifyListeners();
  }

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
}
