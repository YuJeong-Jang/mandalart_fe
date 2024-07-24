import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/View/ActionRegister.dart';
import 'package:make_me_better_mandalart_fe/View/BoardRegister.dart';
import 'package:make_me_better_mandalart_fe/View/Join.dart';
import 'package:make_me_better_mandalart_fe/View/Login.dart';
import 'package:make_me_better_mandalart_fe/View/MainPage.dart';
import 'package:make_me_better_mandalart_fe/View/MissionRegister.dart';
import 'package:make_me_better_mandalart_fe/View/Welcome.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPage createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Text('웰컴페이지'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
            InkWell(
              child: Text('회원가입'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Join()));
              },
            ),
            InkWell(
              child: Text('로그인'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            InkWell(
              child: Text('메인'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
            InkWell(
              child: Text('보드등록'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BoardRegister(
                              modify: false,
                            )));
              },
            ),
            InkWell(
              child: Text('보드수정'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BoardRegister(
                              modify: true,
                            )));
              },
            ),
            InkWell(
              child: Text('액션등록'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActionRegister(
                              modify: false,
                            )));
              },
            ),
            InkWell(
              child: Text('액션수정'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActionRegister(
                              modify: true,
                            )));
              },
            ),
            InkWell(
              child: Text('미션등록'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MissionRegister(
                              modify: false,
                            )));
              },
            ),
            InkWell(
              child: Text('미션수정'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MissionRegister(
                              modify: true,
                            )));
              },
            ),
          ],
        )));
  }
}
