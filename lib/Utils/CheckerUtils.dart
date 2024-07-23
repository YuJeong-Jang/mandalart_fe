import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';

class CheckerUtils {
  BuildContext context;

  CheckerUtils(this.context);

  static String CHECKER_URL = MMBUtils.BASE_URL + 'checker/';

  static Future<String> getActions() async {
    try {
      Response response = await Dio().get(CHECKER_URL + '/actions/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> postActions() async {
    try {
      Map inputData = {
        "title": "string",
        "mission_id": 0,
        "cycle": "once",
        "goal_unit": BigInt.parse('9223372036854776000'),
        "action_unit": BigInt.parse('9223372036854776000'),
        "unit_name": "string",
        "achievement": BigInt.parse('9223372036854776000')
      };
      Response response =
          await Dio().post(CHECKER_URL + '/actions/', data: inputData);

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getActionsAsId(int id) async {
    try {
      Response response = await Dio().get(CHECKER_URL + '/actions/${"userId"}/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> putActionsAsId(int id) async {
    try {
      Map inputData = {
        "title": "string",
        "mission_id": 0,
        "cycle": "once",
        "goal_unit": BigInt.parse('9223372036854776000'),
        "action_unit": BigInt.parse('9223372036854776000'),
        "unit_name": "string",
        "achievement": BigInt.parse('9223372036854776000')
      };
      Response response = await Dio()
          .put(CHECKER_URL + '/actions/${"userId"}/', data: inputData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> patchActionsAsId(int id) async {
    try {
      Map inputData = {
        "title": "string",
        "mission_id": 0,
        "cycle": "once",
        "goal_unit": BigInt.parse('9223372036854776000'),
        "action_unit": BigInt.parse('9223372036854776000'),
        "unit_name": "string",
        "achievement": BigInt.parse('9223372036854776000')
      };
      Response response = await Dio()
          .patch(CHECKER_URL + '/actions/${"userId"}/', data: inputData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> deleteActionsAsId(int id) async {
    try {
      Response response =
          await Dio().delete(CHECKER_URL + '/actions/${"userId"}/');

      if (response.statusCode == 204) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getBoards() async {
    try {
      Response response = await Dio().get(CHECKER_URL + '/baords/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> postBoards() async {
    try {
      Map inputData = {
        "deleted": "2024-07-23T07:23:50.064Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response =
          await Dio().post(CHECKER_URL + '/baords/', data: inputData);

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getBoardsAsId() async {
    try {
      Response response = await Dio().get(CHECKER_URL + '/baords/${'userId'}/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> putBoardsAsId() async {
    try {
      Map inputData = {
        "deleted": "2024-07-23T07:23:50.064Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response =
          await Dio().put(CHECKER_URL + '/baords/${'userId'}/', data: inputData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> patchBoardsAsId() async {
    try {
      Map inputData = {
        "deleted": "2024-07-23T07:25:46.255Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio()
          .patch(CHECKER_URL + '/baords/${'userId'}/', data: inputData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> deleteBoardsAsId() async {
    try {
      Response response =
          await Dio().delete(CHECKER_URL + '/baords/${'userId'}/');

      if (response.statusCode == 204) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getMissions() async {
    try {
      Response response = await Dio().get(CHECKER_URL + '/missions/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> postMissions() async {
    try {
      Map inputData = {"title": "string", "board_id": 0};
      Response response =
          await Dio().post(CHECKER_URL + '/missions/', data: inputData);

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> getMissionsAsId() async {
    try {
      Response response =
          await Dio().get(CHECKER_URL + '/missions/${'userId'}/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> putMissionsAsId() async {
    try {
      Map inputData = {
        "deleted": "2024-07-23T07:25:46.255Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio()
          .put(CHECKER_URL + '/missions/${'userId'}/', data: inputData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> patchMissionsAsId() async {
    try {
      Map inputData = {
        "deleted": "2024-07-23T07:25:46.255Z",
        "title": "string",
        "achievement": BigInt.parse('9223372036854776000'),
        "start_at": "2024-07-23",
        "end_at": "2024-07-23"
      };
      Response response = await Dio()
          .patch(CHECKER_URL + '/missions/${'userId'}/', data: inputData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }

  static Future<String> deleteMissionsAsId() async {
    try {
      Response response =
          await Dio().patch(CHECKER_URL + '/missions/${'userId'}/');

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
