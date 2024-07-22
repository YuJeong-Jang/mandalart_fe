import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:make_me_better_mandalart_fe/View/ChangeMyInfo.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawer createState() => _MainDrawer();
}

class _MainDrawer extends State<MainDrawer> {
  String nickName = '엄태구 짝사랑';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: '어서오세요 ',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: nickName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '님!',
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ])),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: DefaultComponents.achive50(),
              border:
                  Border.all(color: DefaultComponents.achive50(), width: 0.5),
            ),
            child: Text(
              '개인정보',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              '회원정보관리',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangeMyInfo()));
            },
          ),
          ListTile(
            title: Text(
              '로그아웃',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onTap: () async {
              await MMBUtils.twoButtonAlert(
                  context, "로그아웃", "로그아웃 하시겠습니까?", () {});
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: DefaultComponents.achive50(),
              border:
                  Border.all(color: DefaultComponents.achive50(), width: 0.5),
            ),
            child: Text(
              '나의 역사',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              '달성내역',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              '통계',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              '히스토리',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: DefaultComponents.achive50(),
              border:
                  Border.all(color: DefaultComponents.achive50(), width: 0.5),
            ),
            child: Text(
              '앱 정보',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              '버전정보',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            trailing: Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
