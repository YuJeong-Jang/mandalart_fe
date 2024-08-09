import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/ActionItem.dart';

class MissionState with ChangeNotifier {
  String document_id = '';
  String missionNm = '';
  String board_doc_id = '';
  int? del_dt;
  bool? del_yn;
  int? reg_dt;
  int? mod_dt;
  List<ActionItem> actions = [];

  changeMissionId(String _val) {
    document_id = _val;
    notifyListeners();
  }

  changeMissionNm(String _val) {
    missionNm = _val;
    notifyListeners();
  }

  changeBoardDocId(String _val) {
    board_doc_id = _val;
    notifyListeners();
  }

  changeMissionRegDt(int _val) {
    reg_dt = _val;
    notifyListeners();
  }

  changeMissionModDt(int _val) {
    mod_dt = _val;
    notifyListeners();
  }

  changeMissionDelDt(int _val) {
    del_dt = _val;
    notifyListeners();
  }

  changeMissionDelYn(bool _val) {
    del_yn = _val;
    notifyListeners();
  }

  changeActions(List<ActionItem> _val) {
    actions = _val;
    notifyListeners();
  }
}
