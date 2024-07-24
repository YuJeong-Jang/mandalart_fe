import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class AuthUtils {
  BuildContext context;

  AuthUtils(this.context);

  static String AUTH_URL = MMBUtils.BASE_URL + 'api/auth/';

  static Future<bool> login(context, Map loginInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response =
          await Dio().post(AUTH_URL + 'login/', data: loginInfo);

      if (response.statusCode == 200) {
        var key = response.data['key'];
        await userState.changeLoginToken(key);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<String> logout(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(AUTH_URL + 'logout/');

      if (response.statusCode == 200) {
        return response.data["detail"];
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<void> passwordChange(context, Map changeInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(AUTH_URL + 'password/change/',
          data: changeInfo,
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        // 비번변경이면 로그아웃 시킬건지?
      } else {}
    } catch (e) {}
  }

  static Future<String> passwordReset(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {"email": "user@example.com"};
      Response response =
          await Dio().post(AUTH_URL + 'password/reset/', data: inputData);

      if (response.statusCode == 200) {
        return response.data["detail"];
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> passwordResetConfirm(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "new_password1": "string",
        "new_password2": "string",
        "uid": "string",
        "token": "string"
      };
      Response response = await Dio()
          .post(AUTH_URL + 'password/reset/confirm/', data: inputData);

      if (response.statusCode == 200) {
        return response.data["detail"];
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<bool> signup(context, signupInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response =
          await Dio().post(AUTH_URL + 'signup/', data: signupInfo);

      if (response.statusCode == 201) {
        var key = response.data['key'];
        await userState.changeLoginToken(key);
        return true;
      } else {
        if (response.statusCode == 400) {
          await MMBUtils.oneButtonAlert(context, "", "입력값을 확인하세요");
        }
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<String> signupResendEmail(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {"email": "user@example.com"};
      Response response =
          await Dio().post(AUTH_URL + 'signup/resend-email/', data: inputData);

      if (response.statusCode == 200) {
        return response.data["detail"];
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> signupverifyEmail(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {"key": "string"};
      Response response =
          await Dio().post(AUTH_URL + 'signup/verify-email/', data: inputData);

      if (response.statusCode == 200) {
        return response.data["detail"];
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<bool> getAuthUser(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(AUTH_URL + 'user/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        var result = response.data;
        await userState.changePk(result['pk']);
        await userState.changeUsername(result['username']);
        await userState.changeEmail(result['email']);
        await userState.changeFirstName(result['first_name']);
        await userState.changeLastName(result['last_name']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<String> putAuthUser(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "username": "0wVE8@FPWa_z",
        "first_name": "string",
        "last_name": "string"
      };
      Response response = await Dio().put(AUTH_URL + 'user/',
          data: inputData,
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<bool> patchAuthUser(context, String username) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {"username": username, "first_name": "", "last_name": ""};
      Response response = await Dio().patch(AUTH_URL + 'user/',
          data: inputData,
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        await userState.changeUsername(response.data['username']);
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
