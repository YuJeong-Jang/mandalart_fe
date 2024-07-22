import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';

class MissionRegister extends StatefulWidget {
  bool modify = false;

  MissionRegister({super.key, required this.modify});

  @override
  _MissionRegister createState() => _MissionRegister();
}

class _MissionRegister extends State<MissionRegister> {
  final scrollerControoer = ScrollController();
  final missionController = TextEditingController();
  final rutineController = TextEditingController();

  final missionFocusNode = FocusNode();

  final _missionInputFocusNode = FocusNode();
  final _rutineInputFocusNode = FocusNode();
  final _missionInputController = TextEditingController();
  final _rutineInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String mission = '';
  String rutine = '';

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
            margin: EdgeInsets.only(right: 8),
            width: 49,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.green, width: 2.0)),
            child: InkWell(
                onTap: () async {},
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
                : TextFormField(
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
        inputRow("미션을 입력해주세요", _missionInputFocusNode, _missionInputController,
            (val) {
          setState(
            () {
              mission = val;
            },
          );
        }, "mission"),
        inputRow("주기를 선택해주세요", _rutineInputFocusNode, _rutineInputController,
            (val) {
          setState(
            () {
              rutine = val;
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
              title: widget.modify ? '미션 수정하기' : '미션 등록하기',
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
                        onTap: () async {},
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
                          if (mission == '' || rutine == '') {
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
