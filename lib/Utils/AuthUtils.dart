import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class AuthUtils {
  BuildContext context;

  AuthUtils(this.context);

  static String AUTH_URL = MMBUtils.BASE_URL + 'api/member/';

  static Future<bool> getToken(context, Map loginInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(AUTH_URL + 'token', data: loginInfo);

      if (response.statusCode == 200) {
        var token = response.data['token'];
        await userState.changeToken(token);
        return true;
      } else {
        if (response.statusCode == 404) {
          await MMBUtils.oneButtonAlert(
              context, "", "회원님의 정보를 찾을 수 없습니다. 회원정보를 확인해주세요.");
        }
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> signup(context, signupInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(AUTH_URL + 'join', data: signupInfo);

      if (response.statusCode == 200) {
        var result = response.data['memberInfo'];
        var token = response.data['token'];
        await userState.changeToken(token);
        await userState.changeDocumentId(result['document_id']);
        await userState.changeEmail(result['email']);
        await userState.changeName(result['name']);
        await userState.changePwd(result['pwd']);
        await userState.changePwdModDt(result['pwd_mod_dt']);
        await userState.changeRegDt(result['reg_dt']);
        await userState.changeModDt(result['mod_dt']);
        return true;
      } else {
        await MMBUtils.oneButtonAlert(context, "", "오류가 발생했습니다. 다시 시도해 주세요.");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> login(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(AUTH_URL + 'login',
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data['memberInfo'];
        var token = response.data['token'];
        await userState.changeToken(token);
        await userState.changeDocumentId(result['document_id']);
        await userState.changeEmail(result['email']);
        await userState.changeName(result['name']);
        await userState.changePwd(result['pwd']);
        await userState.changePwdModDt(result['pwd_mod_dt']);
        await userState.changeRegDt(result['reg_dt']);
        await userState.changeModDt(result['mod_dt']);
        await userState.changeBoardInfo(response.data['boardInfo']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> changeMemberInfo(context, Map changeInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(AUTH_URL + 'changeMemberInfo',
          data: changeInfo,
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        // 비번변경이면 로그아웃 시킬건지?
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
