import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Models/Board.dart';
import 'package:make_me_better_mandalart_fe/States/BoardState.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class BoardsUtils {
  BuildContext context;

  BoardsUtils(this.context);

  static String BOARD_URL = MMBUtils.BASE_URL + 'boards/';

  static Future<bool> getBoard(context, String docId) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      var boardState = Provider.of<BoardState>(context, listen: false);
      Response response = await Dio().get(BOARD_URL + 'get/${docId}',
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data;
        await boardState.changeBoardName(result['board_name']);
        await boardState.changeBoardDailyGoal(result['daily_goal']);
        await boardState.changeBoardStartAt(result['start_at']);
        await boardState.changeBoardEndAt(result['end_at']);
        await boardState.changeBoardId(result['document_id']);
        await boardState.changeBoardRegDt(result['reg_dt']);
        await boardState.changeBoardModDt(result['mod_dt']);
        await boardState.changeBoardDelDt(result['del_dt']);
        await boardState.changeBoardDelYn(result['del_yn']);
        await boardState.changeBoardTotalPercentage(result['total_percentage']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // static Future<List<Board>> getBoardList(context) async {
  //   try {
  //     var userState = Provider.of<UserState>(context, listen: false);
  //     Response response = await Dio().get(BOARD_URL + 'getList/',
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

  static Future<bool> postBoard(context, Board boardInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      var boardState = Provider.of<BoardState>(context, listen: false);
      Response response = await Dio().post(BOARD_URL + 'register/',
          data: boardInfo,
          options: Options(headers: {"Authorization": userState.token}));

      if (response.statusCode == 200) {
        var result = response.data;
        await boardState.changeBoardName(result['board_name']);
        await boardState.changeBoardDailyGoal(result['daily_goal']);
        await boardState.changeBoardStartAt(result['start_at']);
        await boardState.changeBoardEndAt(result['end_at']);
        await boardState.changeBoardId(result['document_id']);
        await boardState.changeBoardRegDt(result['reg_dt']);
        await boardState.changeBoardModDt(result['mod_dt']);
        await boardState.changeBoardDelDt(result['del_dt']);
        await boardState.changeBoardDelYn(result['del_yn']);
        await boardState.changeBoardTotalPercentage(result['total_percentage']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateBoard(context, Board boardInfo) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(BOARD_URL + 'update/',
          data: boardInfo,
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

  static Future<String> deleteBoard(context, String docId) async {
    try {
      var userState = Provider.of<UserState>(context, listen: false);
      Response response = await Dio().post(BOARD_URL + 'delete/${docId}',
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
