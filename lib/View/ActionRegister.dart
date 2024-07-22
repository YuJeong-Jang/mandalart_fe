import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';

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
  String rutine = '';
  String goalUnit = '';
  String achiveUnit = '';

  Map<String, String> dropDownList = <String, String>{
    '엄태구': '엄태구',
    '상남자': '상남자',
    '사랑해!!': '사랑해!!',
  };

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

  Widget rutineList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        String rutine = MMBUtils.rutines[index];
        return Container(
            margin: EdgeInsets.only(right: 3, left: 3),
            width: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: DefaultComponents.achive50(), width: 2.0),
              color: mission != '' && mission == rutine
                  ? DefaultComponents.achive50()
                  : Colors.transparent,
            ),
            child: InkWell(
                onTap: () async {
                  setState(() {
                    mission = rutine;
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
                        width: 200,
                        child: DropdownButton(
                            items: dropDownList.keys
                                .map<DropdownMenuItem<String>>((String value) {
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
                            onChanged: (value) {},
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
                            dropdownColor: DefaultComponents.black()),
                      )
                    : TextFormField(
                        validator: (val) {
                          if (val!.length == 0) {
                            return '최소 한 글자 이상 입력해주세요';
                          } else if (val.runtimeType == String) {
                            return '숫자만 입력하세요';
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
              rutine = val;
            },
          );
        }, "rutine"),
        inputRow(
            "목표단위를 입력해주세요", _goalUnitInputFocusNode, _goalUnitInputController,
            (val) {
          setState(
            () {
              goalUnit = val;
            },
          );
        }, "goalUnit"),
        inputRow("수행단위를 입력해주세요", _achiveUnitInputFocusNode,
            _achiveUnitInputController, (val) {
          setState(
            () {
              achiveUnit = val;
            },
          );
        }, "achiveUnit"),
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
                          if (mission == '' ||
                              action == '' ||
                              rutine == '' ||
                              goalUnit == '') {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "필수 입력을 확인하세요");
                          }
                          if (rutine != goalUnit) {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "비밀번호를 확인하세요");
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
                          if (mission == '' ||
                              action == '' ||
                              rutine == '' ||
                              goalUnit == '') {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "필수 입력을 확인하세요");
                          }
                          if (rutine != goalUnit) {
                            return await MMBUtils.oneButtonAlert(
                                context, "", "비밀번호를 확인하세요");
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
