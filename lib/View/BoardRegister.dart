import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';

class BoardRegister extends StatefulWidget {
  bool modify = false;

  BoardRegister({super.key, required this.modify});

  @override
  _BoardRegister createState() => _BoardRegister();
}

class _BoardRegister extends State<BoardRegister> {
  final scrollerControoer = ScrollController();
  final titleController = TextEditingController();
  final dailyGoalController = TextEditingController();
  final startAtController = TextEditingController();
  final endAtController = TextEditingController();

  final titleFocusNode = FocusNode();
  final dailyGoalFocusNode = FocusNode();

  final _titleInputFocusNode = FocusNode();
  final _dailyGoalInputFocusNode = FocusNode();
  final _startAtInputFocusNode = FocusNode();
  final _endAtInputFocusNode = FocusNode();
  final _titleInputController = TextEditingController();
  final _dailyGoalInputController = TextEditingController();
  final _startAtInputController = TextEditingController();
  final _endAtInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String title = '';
  String dailyGoal = '';
  String startAt = '';
  String endAt = '';

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

  Widget inputRow(String hintText, FocusNode _focusNode,
      TextEditingController _controller, Function changeState, String type) {
    return Container(
        child: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
                        validator: (val) {
                          if (val!.length == 0) {
                            return '최소 한 글자 이상 입력해주세요';
                          } 
                          return null;
                        },
                        onSaved: (newValue) {
                          changeState(newValue);
                        },
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: DefaultComponents.achive50(),
                                    width: 2.0)),
                            labelText: hintText,
                            labelStyle: TextStyle(
                                color: DefaultComponents.achive50(),
                                fontSize: 13)),
                        maxLines: 1,
                        focusNode: _focusNode,
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          if (formKey.currentState!.validate()) {
                            return;
                          } else {
                            formKey.currentState!.save();
                            changeState(value);
                          }
                        },
                      ))
      ],
    ));
  }

  Widget mainInput() {
    return Column(
      children: [
        inputRow("보드의 이름을 지정해주세요", _titleInputFocusNode, _titleInputController,
            (val) {
          setState(
            () {
              title = val;
            },
          );
        }, "mission"),
        inputRow("목표 기간을 선택해주세요", _startAtInputFocusNode, _startAtInputController,
            (val) {
          setState(
            () {
              startAt = val;
            },
          );
        }, "action"),
        inputRow("일일 목표 달성 갯수를 설정해주세요", _dailyGoalInputFocusNode, _dailyGoalInputController,
            (val) {
          setState(
            () {
              dailyGoal = val;
            },
          );
        }, "rutine"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: widget.modify ? '보드 수정하기' : '보드 등록하기',
              leading: true,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () async {
                          if (title == '' ||
                              dailyGoal == '' ||
                              startAt == '' ||
                              endAt == '') {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "필수 입력을 확인하세요");
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
                              '삭제하기',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ))),
                    InkWell(
                        onTap: () async {
                          if (title == '' ||
                              dailyGoal == '' ||
                              startAt == '' ||
                              endAt == '') {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "필수 입력을 확인하세요");
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
