import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/ActionItem.dart';
import 'package:make_me_better_mandalart_fe/States/ActionState.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class ActionsUtils {
  BuildContext context;

  ActionsUtils(this.context);

  static String ACTION_URL = MMBUtils.BASE_URL + 'actions/';

  static Future<bool> getAction(context, String docId) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      var actionState = Provider.of<ActionState>(context, listen: false);
      Response response = await Dio().get(ACTION_URL + 'get/',
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data;
        await actionState.changeActionId(result['document_id']);
        await actionState.changeBoardDelDt(result['del_dt']);
        await actionState.changeBoardDelYn(result['del_yn']);
        await actionState.changeBoardRegDt(result['reg_dt']);
        await actionState.changeBoardModDt(result['mod_dt']);
        await actionState.changeActionName(result['action_name']);
        await actionState.changeMissionDocId(result['mission_doc_id']);
        await actionState.changeBoardDocId(result['board_doc_id']);
        await actionState.changeCycle(result['cycle']);
        await actionState.changeGoalUnit(result['goal_unit']);
        await actionState.changeActionUnit(result['action_unit']);
        await actionState.changeUnit(result['unit']);
        await actionState.changeActionAchievement(result['achievement']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // static Future<List<ActionItem>> getActionList(context) async {
  //   try {
  //     var userState = Provider.of<UserState>(context, listen: false);
  //     Response response = await Dio().get(ACTION_URL + 'getList/',
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

  static Future<bool> postAction(context, ActionItem boardInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      var actionState = Provider.of<ActionState>(context, listen: false);
      Response response = await Dio().post(ACTION_URL + 'register/',
          data: boardInfo,
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data;
        await actionState.changeActionId(result['document_id']);
        await actionState.changeBoardDelDt(result['del_dt']);
        await actionState.changeBoardDelYn(result['del_yn']);
        await actionState.changeBoardRegDt(result['reg_dt']);
        await actionState.changeBoardModDt(result['mod_dt']);
        await actionState.changeActionName(result['action_name']);
        await actionState.changeMissionDocId(result['mission_doc_id']);
        await actionState.changeBoardDocId(result['board_doc_id']);
        await actionState.changeCycle(result['cycle']);
        await actionState.changeGoalUnit(result['goal_unit']);
        await actionState.changeActionUnit(result['action_unit']);
        await actionState.changeUnit(result['unit']);
        await actionState.changeActionAchievement(result['achievement']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateAction(
      context, ActionItem action) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(ACTION_URL + 'update/',
          data: action,
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

  static Future<String> deleteAction(context, String docId) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(ACTION_URL + 'delete/${docId}',
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
