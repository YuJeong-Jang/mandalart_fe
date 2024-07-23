import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MMBUtils {
  BuildContext context;

  MMBUtils(this.context);

  static String BASE_URL =
      'http://ec2-3-38-162-31.ap-northeast-2.compute.amazonaws.com/';

  static List rutines = ["일회성", "매일", "매주", "매월", "매년"];

  static Future oneButtonAlert(
      BuildContext context, String title, String content) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0.0,
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(child: Text(title)),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(content),
                ),
                TextButton(
                  child: Text(
                    '닫기',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      },
    );
  }

  static Future twoButtonAlert(
      BuildContext context, String title, String content, Function action) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0.0,
            backgroundColor: Colors.white,
            content: Text(content),
            actions: [
              TextButton(
                child: Text('닫기'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  action();
                },
              )
            ]);
      },
    );
  }
}
