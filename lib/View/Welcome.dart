import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/View/Join.dart';
import 'package:make_me_better_mandalart_fe/View/Login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'welcome to "make me better"!',
          leading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.task_alt,
              color: Colors.white,
              size: 200.0,
            )),
            SizedBox(
              height: 100,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Join()));
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    width: 200,
                    child: Text(
                      '회원가입',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: DefaultComponents.achive50(), width: 2.0),
                        color: DefaultComponents.achive50()))),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    width: 200,
                    child: Text(
                      '로그인',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: DefaultComponents.achive50(), width: 2.0),
                    )))
          ],
        ));
  }
}
