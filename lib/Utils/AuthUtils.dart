import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class AuthUtils {
  BuildContext context;

  AuthUtils(this.context);

  static String AUTH_URL = MMBUtils.BASE_URL + 'member/';

  static Future<bool> getToken(context, Map loginInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(AUTH_URL + 'token', data: loginInfo);

      if (response.statusCode == 200) {
        var token = response.data['token'];
        await userState.changeToken(token);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e);
      if (e.response?.data['errorCode'] == 'INVALID_AUTH') {
        await MMBUtils.oneButtonAlert(context, "", "고객인증에 실패했습니다. 정보를 확인해주세요.");
      } else if (e.response?.data['errorCode'] == 'MEMBER_NOT_FOUND') {
        await MMBUtils.oneButtonAlert(
            context, "", "고객정보를 찾을 수 없습니다. 정보를 확인해주세요.");
      } else {
        await MMBUtils.oneButtonAlert(context, "", "오류가 발생했습니다. 다시 시도해 주세요.");
      }
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
        return false;
      }
    } on DioException catch (e) {
      print(e);
      if (e.response?.data['errorCode'] == 'ALREADY_JOINED') {
        await MMBUtils.oneButtonAlert(context, "", "이미 가입하신 고객입니다.");
      } else if (e.response?.data['errorCode'] == 'DELETED_MEMBER') {
        await MMBUtils.oneButtonAlert(
            context, "", "탈퇴한 고객입니다. 탈퇴한 이메일로는 재가입이 불가합니다.");
      } else {
        await MMBUtils.oneButtonAlert(context, "", "가입에 실패했습니다. 다시 시도해 주세요.");
      }
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
    } on DioException catch (e) {
      print(e);
      if (e.response?.data['errorCode'] == 'INVALID_AUTH') {
        await MMBUtils.oneButtonAlert(context, "", "고객인증에 실패했습니다.");
      } else {
        await MMBUtils.oneButtonAlert(context, "", "로그인에 실패했습니다. 정보를 확인해주세요.");
      }
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
        var result = response.data['memberInfo'];
        await userState.changeName(result['name']);
        await userState.changeToken(response.data['token']);
        // 비번 변경시 로그아웃?
        // await userState.changePwd(result['pwd']);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e);
      if (e.response?.data['errorCode'] == 'INVALID_AUTH') {
        await MMBUtils.oneButtonAlert(context, "", "고객인증에 실패했습니다.");
      } else {
        await MMBUtils.oneButtonAlert(context, "", "수정에 실패했습니다. 다시 시도해주세요.");
      }
      return false;
    }
  }
}
