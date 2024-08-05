import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Board.dart';

class UserState with ChangeNotifier {
  String document_id = "";
  String name = '';
  String email = '';
  String? pwd;
  int? pwd_mod_dt;
  String? token;
  Map? boardInfo;
  int? reg_dt;
  int? mod_dt;

  changeDocumentId(String _val) {
    document_id = _val;
    notifyListeners();
  }

  changeName(String _val) {
    name = _val;
    notifyListeners();
  }

  changeEmail(String _val) {
    email = _val;
    notifyListeners();
  }

  changeToken(String _val) {
    token = _val;
    notifyListeners();
  }

  changePwd(String _val) {
    pwd = _val;
    notifyListeners();
  }

  changePwdModDt(int _val) {
    pwd_mod_dt = _val;
    notifyListeners();
  }

  changeBoardInfo(Map _val) {
    boardInfo = _val;
    notifyListeners();
  }

  changeRegDt(int _val) {
    reg_dt = _val;
    notifyListeners();
  }

  changeModDt(int _val) {
    mod_dt = _val;
    notifyListeners();
  }
}
