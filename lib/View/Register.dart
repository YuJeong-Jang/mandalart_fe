import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final scrollerControoer = ScrollController();
  final missionController = TextEditingController();
  final itemController = TextEditingController();
  final rutineController = TextEditingController();
  final goalUnitController = TextEditingController();
  final achiveUnitController = TextEditingController();

  final missionFocusNode = FocusNode();
  final itemFocusNode = FocusNode();

  final _missionInputFocusNode = FocusNode();
  final _itemInputFocusNode = FocusNode();
  final _rutineInputFocusNode = FocusNode();
  final _goalUnitInputFocusNode = FocusNode();
  final _achiveUnitInputFocusNode = FocusNode();
  final _missionInputController = TextEditingController();
  final _itemInputController = TextEditingController();
  final _rutineInputController = TextEditingController();
  final _goalUnitInputController = TextEditingController();
  final _achiveUnitInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String mission = '';
  String item = '';
  String rutine = '';
  String goalUnit = '';
  String achiveUnit = '';

  List rutines = ["일회성", "매일", "매주", "매월", "매년"];
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
        String rutine = rutines[index];
        return Container(
            margin: EdgeInsets.all(1),
            width: 49,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.green, width: 2.0)),
            child: InkWell(
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Center(
                    child: Text(
                  rutine,
                  style: TextStyle(fontSize: 12),
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
                : TextFormField(
                    obscureText: type == 'rutine' ? true : false,
                    validator: (val) {
                      if (val!.length == 0) {
                        if (val.runtimeType == 'String' &&
                            (type == 'goalUnit' || type == 'achiveUnit')) {
                          return '숫자만 입력하세요';
                        } else {
                          return '최소 한 글자 이상 입력해주세요';
                        }
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
                            color: DefaultComponents.achive50(), fontSize: 13)),
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
        inputRow("액션을 입력하세요", _itemInputFocusNode, _itemInputController, (val) {
          setState(
            () {
              item = val;
            },
          );
        }, "item"),
        inputRow("주기를 선택해주세요", _rutineInputFocusNode, _rutineInputController,
            (val) {
          setState(
            () {
              rutine = val;
            },
          );
        }, "rutine"),
        inputRow("목표 단위를 적어주세요(예 : 10회, 10km 등)", _goalUnitInputFocusNode,
            _goalUnitInputController, (val) {
          setState(
            () {
              goalUnit = val;
            },
          );
        }, "goalUnit"),
        inputRow("수행 단위를 적어주세요(예 : 10회, 10km 등)", _achiveUnitInputFocusNode,
            _achiveUnitInputController, (val) {
          setState(
            () {
              achiveUnit = val;
            },
          );
        }, "achiveUnit")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: '등록하기',
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
                              color: DefaultComponents.achive25(), width: 3.0),
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
                              item == '' ||
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
                                    color: DefaultComponents.achive25(),
                                    width: 2.0)),
                            child: Text(
                              '삭제하기',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ))),
                    InkWell(
                        onTap: () async {
                          if (mission == '' ||
                              item == '' ||
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
                                    color: DefaultComponents.achive25(),
                                    width: 2.0),
                                color: DefaultComponents.achive25()),
                            child: Text(
                              '저장하기',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )))
                  ],
                )
              ],
            )));
  }
}
