import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Mission.dart';
import 'package:make_me_better_mandalart_fe/States/MissionState.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class MissionsUtils {
  BuildContext context;

  MissionsUtils(this.context);

  static String MISSION_URL = MMBUtils.BASE_URL + 'missions/';
  static Future<bool> getMission(context, String docId) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      var missionState = Provider.of<MissionState>(context, listen: false);
      Response response = await Dio().get(MISSION_URL + 'get/',
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data;
        await missionState.changeMissionId(result['document_id']);
        await missionState.changeMissionDelDt(result['del_dt']);
        await missionState.changeMissionDelYn(result['del_yn']);
        await missionState.changeMissionRegDt(result['reg_dt']);
        await missionState.changeMissionModDt(result['mod_dt']);
        await missionState.changeMissionNm(result['mission_name']);
        await missionState.changeBoardDocId(result['board_doc_id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // static Future<List<Mission>> getMissionList(context) async {
  //   try {
  //     var userState = Provider.of<MissionState>(context, listen: false);
  //     Response response = await Dio().get(MISSION_URL + 'getList/',
  //         options: Options(headers: {"Authorization": userState.token}));

  //     if (response.statusCode == 200) {
  //       return response.data;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }

  static Future<bool> postMission(context, Mission boardInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      var missionState = Provider.of<MissionState>(context, listen: false);
      Response response = await Dio().post(MISSION_URL + 'register/',
          data: boardInfo,
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data;
        await missionState.changeMissionId(result['document_id']);
        await missionState.changeMissionDelDt(result['del_dt']);
        await missionState.changeMissionDelYn(result['del_yn']);
        await missionState.changeMissionRegDt(result['reg_dt']);
        await missionState.changeMissionModDt(result['mod_dt']);
        await missionState.changeMissionNm(result['mission_name']);
        await missionState.changeBoardDocId(result['board_doc_id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateMission(context, Mission mission) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(MISSION_URL + 'update/',
          data: mission,
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<String> deleteMission(context, String docId) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(MISSION_URL + 'delete/${docId}',
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "NOTHING";
      }
    } catch (e) {
      return "NOTHING";
    }
  }
}
