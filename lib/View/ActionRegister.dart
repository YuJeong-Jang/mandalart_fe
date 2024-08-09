import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Models/ActionItem.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/Utils/ActionsUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/BoardsUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class ActionRegister extends StatefulWidget {
  bool modify = false;

  ActionRegister({super.key, required this.modify});

  @override
  _ActionRegister createState() => _ActionRegister();
}

class _ActionRegister extends State<ActionRegister> {
  final scrollerControoer = ScrollController();
  final missionController = TextEditingController();
  final actionController = TextEditingController();
  final rutineController = TextEditingController();
  final goalUnitController = TextEditingController();
  final achiveUnitController = TextEditingController();

  final missionFocusNode = FocusNode();
  final actionFocusNode = FocusNode();

  final _missionInputFocusNode = FocusNode();
  final _actionInputFocusNode = FocusNode();
  final _rutineInputFocusNode = FocusNode();
  final _goalUnitInputFocusNode = FocusNode();
  final _achiveUnitInputFocusNode = FocusNode();
  final _missionInputController = TextEditingController();
  final _actionInputController = TextEditingController();
  final _rutineInputController = TextEditingController();
  final _goalUnitInputController = TextEditingController();
  final _achiveUnitInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String mission = '';
  String action = '';
  String setRutine = '';
  int goalUnit = 0;
  int actionUnit = 0;

  Map<String, String> dropDownList = <String, String>{
    '엄태구': '엄태구',
    '상남자': '상남자',
    '사랑해!!': '사랑해!!',
  };
  List rutineKeyList = [];

  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    setRutineList();
    _dismissKeyboard();
  }

  void _dismissKeyboard() {
    try {
      // 인풋 포커스 해제
      FocusScope.of(context).unfocus();
    } catch (err) {}
  }

  void setRutineList() {
    Map rutines = MMBUtils.rutines;
    setState(() {
      rutineKeyList = rutines.keys.toList();
    });
  }

  checkError(_controller, type) {
    if (type == 'unit') {
      return '최소 한 글자\n이상 입력하세요';
    }
    if (_controller.text.isEmpty) {
      return '최소 한 글자 이상 입력하세요';
    }
  }

  Widget rutineList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        String rutine = rutineKeyList[index];
        return Container(
            margin: EdgeInsets.only(right: 3, left: 3),
            width: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: DefaultComponents.achive50(), width: 2.0),
              color: setRutine == rutine
                  ? DefaultComponents.achive50()
                  : Colors.transparent,
            ),
            child: InkWell(
                onTap: () async {
                  setState(() {
                    setRutine = rutine;
                  });
                },
                child: Center(
                    child: Text(
                  rutine,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ))));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container();
      },
    );
  }

  Widget textFormField(String hintText, FocusNode _focusNode,
      TextEditingController _controller, Function changeState, String type) {
    return TextFormField(
      validator: (val) {
        return;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: DefaultComponents.achive50(), width: 2.0)),
          labelText: hintText,
          labelStyle:
              TextStyle(color: DefaultComponents.achive50(), fontSize: 13),
          errorText: checkError(_controller, type)),
      maxLines: 1,
      focusNode: _focusNode,
      controller: _controller,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        changeState(value);
      },
    );
  }

  Widget inputRow(String hintText, FocusNode _focusNode,
      TextEditingController _controller, Function changeState, String type) {
    return Container(
        child: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: type == 'rutine'
                ? SizedBox(
                    height: 60,
                    child: Container(
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        width: MediaQuery.of(context).size.width,
                        child: rutineList()))
                : type == 'mission'
                    ? Container(
                        width: 300,
                        child: DropdownButton(
                            items: dropDownList.keys.map((String value) {
                              print(value);
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                    width: 200,
                                    padding: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: DefaultComponents
                                                    .achive50(),
                                                width: 2.0))),
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ));
                            }).toList(),
                            borderRadius: BorderRadius.circular(10),
                            hint: Text(
                              '미션을 선택해주세요',
                              style: TextStyle(
                                  color: DefaultComponents.achive50()),
                            ),
                            alignment: AlignmentDirectional.center,
                            disabledHint: Text(
                              '미션선택은 필수입니다',
                              style: TextStyle(color: Colors.red),
                            ),
                            onChanged: (value) {
                              setState(() {
                                mission = value!;
                              });
                            },
                            value: mission == '' ? null : mission,
                            focusColor: Colors.white,
                            style: TextStyle(
                              color: DefaultComponents.achive50(),
                            ),
                            isExpanded: true,
                            underline: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: DefaultComponents.achive50(),
                                          width: 2.0))),
                            ),
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.black),
                      )
                    : type == 'unit'
                        ? Container(
                            height: 200,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 0,
                                    child: Container(
                                      width: 160,
                                      child: textFormField(
                                          "목표를 입력하세요\n(ex: 10회, 10km 등)",
                                          _focusNode,
                                          _controller,
                                          changeState,
                                          "goal"),
                                    )),
                                Positioned(
                                    top: 60,
                                    left: 180,
                                    child: Container(
                                        width: 110,
                                        child: textFormField(
                                            "단위를\n입력하세요",
                                            _focusNode,
                                            _controller,
                                            changeState,
                                            "unit"))),
                                Positioned(
                                    top: 110,
                                    // right: 100,
                                    child: Container(
                                        width: 160,
                                        child: textFormField(
                                            "수행목표를 입력하세요\n(ex: 1회, 1km 등)",
                                            _focusNode,
                                            _controller,
                                            changeState,
                                            "action")))
                              ],
                            ))
                        : textFormField(hintText, _focusNode, _controller,
                            changeState, type))
      ],
    ));
  }

  Widget mainInput() {
    return Column(
      children: [
        inputRow("미션을 선택해주세요", _missionInputFocusNode, _missionInputController,
            (val) {
          setState(
            () {
              mission = val;
            },
          );
        }, "mission"),
        inputRow("액션을 선택해주세요", _actionInputFocusNode, _actionInputController,
            (val) {
          setState(
            () {
              action = val;
            },
          );
        }, "action"),
        inputRow("주기를 선택해주세요", _rutineInputFocusNode, _rutineInputController,
            (val) {
          setState(
            () {
              setRutine = val;
            },
          );
        }, "rutine"),
        inputRow(
            "단위를 입력해주세요", _goalUnitInputFocusNode, _goalUnitInputController,
            (val) {
          setState(
            () {
              // goalUnit = val;
            },
          );
        }, "unit"),
        // inputRow(
        //     "목표단위를 입력해주세요", _goalUnitInputFocusNode, _goalUnitInputController,
        //     (val) {
        //   setState(
        //     () {
        //       goalUnit = val;
        //     },
        //   );
        // }, "goalUnit"),
        // inputRow("수행단위를 입력해주세요", _achiveUnitInputFocusNode,
        //     _achiveUnitInputController, (val) {
        //   setState(
        //     () {
        //       achiveUnit = val;
        //     },
        //   );
        // }, "achiveUnit"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: widget.modify ? '액션 수정하기' : '액션 등록하기',
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
                          if (!widget.modify) {
                            Navigator.pop(context);
                          } else {
                            await MMBUtils.twoButtonAlert(
                                context, '삭제하기', '정말 삭제하시겠습니까?', () async {
                              // 액션 아이디 바꿔야함
                              await ActionsUtils.deleteAction(context, "");
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
                            ))),
                    InkWell(
                        onTap: () async {
                          if (mission == '' ||
                              action == '' ||
                              setRutine == '' ||
                              goalUnit == '') {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "필수 입력을 확인하세요");
                          }
                          var navigationState = Provider.of<NavigationState>(
                              context,
                              listen: false);
                          ActionItem actionInfo = ActionItem.fromNamed(
                            document_id: '',
                            action_name: action,
                            mission_doc_id: '',
                            cycle: setRutine,
                            board_doc_id: '',
                            action_unit: actionUnit,
                            goal_unit: goalUnit,
                            unit: '',
                          );

                          bool postActionResult;
                          if (widget.modify) {
                            postActionResult = await ActionsUtils.updateAction(
                                context, actionInfo);
                          } else {
                            postActionResult = await ActionsUtils.postAction(
                                context, actionInfo);
                          }
                          if (!postActionResult) {
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
