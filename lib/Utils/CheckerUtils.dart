import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Board.dart';
import 'package:make_me_better_mandalart_fe/Models/Mission.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class CheckerUtils {
  BuildContext context;

  CheckerUtils(this.context);

  static String CHECKER_URL = MMBUtils.BASE_URL + 'checker/';

  static Future<List<Action>> getActions(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(CHECKER_URL + '/actions/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<String> postActions(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "title": "string",
        "mission_id": 0,
        "cycle": "once",
        "goal_unit": BigInt.parse('9223372036854776000'),
        "action_unit": BigInt.parse('9223372036854776000'),
        "unit_name": "string",
        "achievement": BigInt.parse('9223372036854776000')
      };
      Response response = await Dio().post(CHECKER_URL + '/actions/',
          data: inputData,
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getActionsAsId(context, int id) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(CHECKER_URL + '/actions/${"userId"}/',
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

  static Future<String> putActionsAsId(context, int id) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "title": "string",
        "mission_id": 0,
        "cycle": "once",
        "goal_unit": BigInt.parse('9223372036854776000'),
        "action_unit": BigInt.parse('9223372036854776000'),
        "unit_name": "string",
        "achievement": BigInt.parse('9223372036854776000')
      };
      Response response = await Dio().put(CHECKER_URL + '/actions/${"userId"}/',
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

  static Future<String> patchActionsAsId(context, int id) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "title": "string",
        "mission_id": 0,
        "cycle": "once",
        "goal_unit": BigInt.parse('9223372036854776000'),
        "action_unit": BigInt.parse('9223372036854776000'),
        "unit_name": "string",
        "achievement": BigInt.parse('9223372036854776000')
      };
      Response response = await Dio().patch(
          CHECKER_URL + '/actions/${"userId"}/',
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

  static Future<String> deleteActionsAsId(context, int id) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().delete(
          CHECKER_URL + '/actions/${"userId"}/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 204) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<List<Board>> getBoards(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(CHECKER_URL + '/baords/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<String> postBoards(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "deleted": "2024-07-23T07:23:50.064Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio().post(CHECKER_URL + '/baords/',
          data: inputData,
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getBoardsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(CHECKER_URL + '/baords/${'userId'}/',
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

  static Future<String> putBoardsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "deleted": "2024-07-23T07:23:50.064Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio().put(CHECKER_URL + '/baords/${'userId'}/',
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

  static Future<String> patchBoardsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "deleted": "2024-07-23T07:25:46.255Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio().patch(
          CHECKER_URL + '/baords/${'userId'}/',
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

  static Future<String> deleteBoardsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().delete(
          CHECKER_URL + '/baords/${'userId'}/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 204) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<List<Mission>> getMissions(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(CHECKER_URL + '/missions/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<String> postMissions(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {"title": "string", "board_id": 0};
      Response response = await Dio().post(CHECKER_URL + '/missions/',
          data: inputData,
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getMissionsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().get(
          CHECKER_URL + '/missions/${'userId'}/',
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

  static Future<String> putMissionsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "deleted": "2024-07-23T07:25:46.255Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio().put(
          CHECKER_URL + '/missions/${'userId'}/',
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

  static Future<String> patchMissionsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Map inputData = {
        "deleted": "2024-07-23T07:25:46.255Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio().patch(
          CHECKER_URL + '/missions/${'userId'}/',
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

  static Future<String> deleteMissionsAsId(context) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().patch(
          CHECKER_URL + '/missions/${'userId'}/',
          options: Options(
              headers: {"Authorization": 'Token ' + userState.loginToken}));

      if (response.statusCode == 204) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }
}