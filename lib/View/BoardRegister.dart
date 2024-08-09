import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Models/Board.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/BoardsUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class BoardRegister extends StatefulWidget {
  bool modify = false;

  BoardRegister({super.key, required this.modify});

  @override
  _BoardRegister createState() => _BoardRegister();
}

class _BoardRegister extends State<BoardRegister> {
  final scrollerControoer = ScrollController();
  final boardNmController = TextEditingController();
  final dailyGoalController = TextEditingController();
  final startAtController = TextEditingController();
  final endAtController = TextEditingController();

  final boardNmFocusNode = FocusNode();
  final dailyGoalFocusNode = FocusNode();

  final _boardNmInputFocusNode = FocusNode();
  final _dailyGoalInputFocusNode = FocusNode();
  final _goalPeriodInputFocusNode = FocusNode();
  final _endAtInputFocusNode = FocusNode();
  final _boardNmInputController = TextEditingController();
  final _dailyGoalInputController = TextEditingController();
  final _goalPeriodInputController = TextEditingController();
  final _endAtInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String boardNm = '';
  int dailyGoal = 0;
  String startAt = "";
  String endAt = "";

  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    _dismissKeyboard();
  }

  void _dismissKeyboard() {
    try {
      // 인풋 포커스 해제
      FocusScope.of(context).unfocus();
    } catch (err) {}
  }

  checkError(_controller, type) {
    if (_controller.text.isEmpty) {
      return '최소 한 글자 이상 입력하세요';
    }
    if (_controller.text.length > 16) {
      return '16자 이상 입력이 불가능합니다.';
    }
  }

  Widget datePicker() {
    return Container(
        child: Row(
      children: [
        Expanded(
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                color: DefaultComponents.achive50(),
                width: 1.0,
              )),
              onPressed: () async {
                final selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900, 01, 01),
                    lastDate: DateTime(3000, 12, 31),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    initialDatePickerMode: DatePickerMode.day);
                if (selectedDate != null) {
                  setState(() {
                    startAt = DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
              },
              child: Text(
                startAt == '' ? '시작 날짜 선택' : startAt,
                style: TextStyle(color: Colors.white, fontSize: 13),
              )),
        ),
        Text(
          ' - ',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        Expanded(
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                  color: DefaultComponents.achive50(),
                  width: 1.0,
                )),
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900, 01, 01),
                      lastDate: DateTime(3000, 12, 31),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDatePickerMode: DatePickerMode.day);
                  if (selectedDate != null) {
                    setState(() {
                      endAt = DateFormat('yyyy-MM-dd').format(selectedDate);
                      ;
                    });
                  }
                },
                child: Text(
                  endAt == '' ? '종료 날짜 선택' : endAt,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )))
      ],
    ));
  }

  Widget inputRow(String hintText, FocusNode _focusNode,
      TextEditingController _controller, Function changeState, String type) {
    return Container(
        child: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: type == 'goalPeriod'
                ? datePicker()
                : TextFormField(
                    validator: (val) {
                      return;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: DefaultComponents.achive50(),
                                width: 2.0)),
                        labelText: hintText,
                        labelStyle: TextStyle(
                            color: DefaultComponents.achive50(), fontSize: 13),
                        errorText: checkError(_controller, type)),
                    maxLines: 1,
                    focusNode: _focusNode,
                    controller: _controller,
                    keyboardType: type == 'dailyGoal'
                        ? TextInputType.number
                        : TextInputType.text,
                    onChanged: (value) {
                      changeState(value);
                    },
                  ))
      ],
    ));
  }

  Widget mainInput() {
    return Column(
      children: [
        inputRow(
            "보드의 이름을 지정해주세요", _boardNmInputFocusNode, _boardNmInputController,
            (val) {
          setState(
            () {
              boardNm = val;
            },
          );
        }, "board"),
        inputRow("목표 기간을 선택해주세요", _goalPeriodInputFocusNode,
            _goalPeriodInputController, () {
          setState(
            () {},
          );
        }, "goalPeriod"),
        inputRow("일일 목표 달성 갯수를 설정해주세요", _dailyGoalInputFocusNode,
            _dailyGoalInputController, (val) {
          setState(
            () {
              dailyGoal = val;
            },
          );
        }, "dailyGoal"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserState>(context, listen: false);
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: widget.modify ? '보드 수정하기' : '보드 등록하기',
              leading: widget.modify,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: formKey,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 30),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: mainInput(),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: DefaultComponents.achive50(), width: 3.0),
                          borderRadius: BorderRadius.circular(20)),
                    )),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: userState.boardInfo != null
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: [
                    userState.boardInfo != null
                        ? InkWell(
                            onTap: () async {
                              if (!widget.modify) {
                                Navigator.pop(context);
                              } else {
                                await MMBUtils.twoButtonAlert(
                                    context, '삭제하기', '정말 삭제하시겠습니까?', () async {
                                  // 보드 아이디 바꿔야함
                                  await BoardsUtils.deleteBoard(context, "");
                                  while (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                });
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(top: 15),
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: DefaultComponents.achive50(),
                                        width: 2.0)),
                                child: Text(
                                  widget.modify ? '삭제하기' : '뒤로가기',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                )))
                        : Container(),
                    InkWell(
                        onTap: () async {
                          if (boardNm == '' ||
                              dailyGoal == '' ||
                              startAt == '' ||
                              endAt == '') {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "필수 입력을 확인하세요");
                          }
                          if (boardNm.length > 16) {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "보드명은 16자까지입니다.");
                          }
                          var navigationState = Provider.of<NavigationState>(
                              context,
                              listen: false);
                          Board boardInfo = Board.fromNamed(
                            boardNm: boardNm,
                            daily_goal: dailyGoal,
                            start_at: startAt,
                            end_at: endAt,
                            document_id: '',
                          );

                          bool postBoardResult;
                          if (widget.modify) {
                            postBoardResult = await BoardsUtils.updateBoard(
                                context, boardInfo);
                          } else {
                            postBoardResult =
                                await BoardsUtils.postBoard(context, boardInfo);
                          }
                          if (!postBoardResult) {
                            return;
                            // MMBUtils.oneButtonAlert(
                            //     context, "", "등록에 실패했습니다");
                          } else {
                            navigationState
                                .changeState(NavigationStateEnum.home);
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            }
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 15),
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: DefaultComponents.achive50(),
                                    width: 2.0),
                                color: DefaultComponents.achive50()),
                            child: Text(
                              widget.modify ? '수정하기' : '저장하기',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )))
                  ],
                )
              ],
            )));
  }
}
