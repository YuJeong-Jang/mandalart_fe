import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/States/ActionState.dart';
import 'package:make_me_better_mandalart_fe/States/BoardState.dart';
import 'package:make_me_better_mandalart_fe/States/MissionState.dart';
import 'package:make_me_better_mandalart_fe/View/ActionRegister.dart';
import 'package:make_me_better_mandalart_fe/View/MainDrawer.dart';
import 'package:make_me_better_mandalart_fe/View/MissionRegister.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  late GlobalKey<ScaffoldState> _drawerKey;

  double todayRate = 78.4;
  double totalRate = 25.7;
  double? todayPercent;
  double? totalPercent;
  String today = DateFormat('MM/dd').format(DateTime(2024, 7, 21));
  String startDt = DateFormat('yyyy-MM-dd').format(DateTime(2024, 1, 1));
  String endDt = DateFormat('yyyy-MM-dd').format(DateTime(2024, 12, 31));
  List actions = [];
  List boards = [];
  List missions = [
    {
      "엄태구": ["하루에 1000원씩 저금", "경제 뉴스레터 읽어보기", "아이템 달성하기"]
    },
    {
      "세븐틴": ["태구야아 태구야아아아", "앓다죽겠네"]
    },
    {
      "덴마크": ["아하하하하하하", "미챠분다 설레서", "나의사랑 너의사랑", "슬슬배고픈데"]
    }
  ];

  @override
  void initState() {
    super.initState();
    _drawerKey = GlobalKey();
    checkLength();
    setState(() {
      todayPercent = todayRate / 100;
      totalPercent = totalRate / 100;
    });
    // initBoard();
  }

  // initBoard() async {
  //   List boardsResult = await CheckerUtils.getBoards(context);
  //   List missionsResult = await CheckerUtils.getMissions(context);
  //   List actionsResult = await CheckerUtils.getActions(context);
  //   setState(() {
  //     boards = boardsResult;
  //     missions = missionsResult;
  //     actions = actionsResult;
  //     todayRate = boards[0]['daily_goal'];
  //     totalRate = boards[0]['total_percentage'];
  //     todayPercent = todayRate / 100;
  //     totalPercent = totalRate / 100;
  //   });
  // }

  checkLength() {
    if (missions.length != 4) {
      for (int i = 0; i < 4 - missions.length; i++) {
        missions.add({"": []});
      }
      setState(() {
        missions.shuffle();
      });
    }

    for (var mission in missions) {
      for (var action in mission.values) {
        actions.addAll(action);
      }
    }
    if (actions.length != 16) {
      int size = 16 - actions.length;
      for (int i = 0; i < size; i++) {
        actions.add("");
      }
      setState(() {
        actions.shuffle();
      });
      print(actions.length);
    }
  }

  Widget missionsList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        String mission = missions[index].keys.firstOrNull;
        return Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(3),
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.green, width: 3.0)),
          child: mission == ''
              ? InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MissionRegister(modify: false)));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
              : InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MissionRegister(modify: true)));
                  },
                  child: Center(
                      child: Text(
                    mission,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ))), //12글자까지 받기
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container();
      },
    );
  }

  Widget actionsGrid() {
    return GridView.builder(
      itemCount: 16,
      itemBuilder: (context, index) {
        String action = actions[index];
        return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(3),
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.green, width: 3.0)),
            child: action == ''
                ? InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ActionRegister(modify: false)));
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
                : InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ActionRegister(modify: true)));
                    },
                    child: Center(
                        child: Text(
                      action,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ))));
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 1 / 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    var boardState = Provider.of<BoardState>(context, listen: false);
    var missionState = Provider.of<MissionState>(context, listen: false);
    var actionState = Provider.of<ActionState>(context, listen: false);
    return Scaffold(
        appBar: CustomAppbar(
          title: boardState.title,
          leading: false,
          preventOnTap: false,
        ),
        key: _drawerKey,
        drawer: MainDrawer(),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: EdgeInsets.only(top: 30),
                child: CircularPercentIndicator(
                  animation: true,
                  reverse: true,
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: todayPercent!,
                  center: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                          text: "$today",
                          style: TextStyle(
                              color: DefaultComponents.achive50(),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "\n$todayRate %",
                          style: TextStyle(
                              color: DefaultComponents.achive50(),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                  progressColor: Colors.green,
                )),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '전체 목표 기간 : $startDt ~ $endDt',
                style: TextStyle(
                    color: DefaultComponents.achive50(),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Container(
                  child: LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width / 5 * 4,
                    lineHeight: 10.0,
                    percent: todayPercent!,
                    progressColor: Colors.green,
                  ),
                ),
                Text('${totalRate.toString()} %')
              ],
            ),
            SizedBox(
                height: 60,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: missionsList())),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 10), child: actionsGrid())),
          ],
        )));
  }
}
