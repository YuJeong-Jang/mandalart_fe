import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Member.dart';

class UserState with ChangeNotifier {
  int pk = 1;
  String username = '';
  String email = '';
  String? first_name;
  String? last_name;
  String? token;
  String? password1;
  String? password2;
  String loginToken = '';
  Member? userInfo;

  changePk(int _val) {
    pk = _val;
    notifyListeners();
  }

  changeUsername(String _val) {
    username = _val;
    notifyListeners();
  }

  changeEmail(String _val) {
    email = _val;
    notifyListeners();
  }

  changeFirstName(String _val) {
    first_name = _val;
    notifyListeners();
  }

  changeLastName(String _val) {
    last_name = _val;
    notifyListeners();
  }

  changeToken(String _val) {
    token = _val;
    notifyListeners();
  }

  changePassword1(String _val) {
    password1 = _val;
    notifyListeners();
  }

  changePassword2(String _val) {
    password2 = _val;
    notifyListeners();
  }

  changeLoginToken(String _val) {
    loginToken = _val;
    notifyListeners();
  }

  changeUserInfo(Member _val) {
    userInfo = _val;
    notifyListeners();
  }
}
