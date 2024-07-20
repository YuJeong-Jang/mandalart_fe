import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';

class MMBUtils {
  BuildContext context;

  MMBUtils(this.context);

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
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadiusDirectional.vertical(
                                top: Radius.circular(0),
                                bottom: Radius.circular(10))),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  color: DefaultComponents.achive25(),
                                  child: Text('확인',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ))),
              ],
            ));
      },
    );
  }
}
