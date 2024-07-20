import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(70),
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: 1.0,
            center: Text("오늘진행률"),
            progressColor: Colors.green,
          ),
        ),
        Container(
          height: 100,
          child: Text('전체 목표 기간 : 2024.01 ~ 2024.12.31'),
        ),
        Container(
          child: LinearPercentIndicator(
            width: 140.0,
            lineHeight: 14.0,
            percent: 0.5,
            progressColor: Colors.green,
          ),
        ),
        Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.green, width: 5.0)),
                      child: Text(
                        '미션미션미션미션미션미션',
                        style: TextStyle(fontSize: 14),
                      )), //12글자까지 받기
                ),
                Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.green, width: 5.0)),
                    child: Text('미션미션미션미션미션미션')),
                Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.green, width: 5.0)),
                    child: Text('미션미션미션미션미션미션')),
                Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.green, width: 5.0)),
                    child: Text('미션미션미션미션미션미션'))
              ],
            )),
        Expanded(
            child: Container(
                child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border:
                                Border.all(color: Colors.green, width: 5.0)),
                        child: Text(
                          '아이템아이템아이템아이템아이템',
                          style: TextStyle(fontSize: 13),
                        ))),
                Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.green, width: 5.0)),
                    child: Text('아이템')),
                Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.green, width: 5.0)),
                    child: Text('아이템')),
                Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.green, width: 5.0)),
                    child: Text('아이템'))
              ],
            );
          },
        ))),
      ],
    );
  }
}
