import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/Utils/AuthUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:provider/provider.dart';

class ChangeMyInfo extends StatefulWidget {
  @override
  _ChangeMyInfo createState() => _ChangeMyInfo();
}

class _ChangeMyInfo extends State<ChangeMyInfo> {
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final _nameInputFocusNode = FocusNode();
  final _nameInputController = TextEditingController();

  String? name;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  }

  Widget inputRow(String hintText, FocusNode _focusNode,
      TextEditingController _controller, Function changeState, String type) {
    return Container(
        child: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              obscureText: type == 'pwd' ? true : false,
              validator: (value) {
                return;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: DefaultComponents.achive50(), width: 2.0)),
                  labelText: hintText,
                  labelStyle: TextStyle(
                      color: DefaultComponents.achive50(), fontSize: 13),
                  errorText: checkError(_controller, type)),
              maxLines: 1,
              focusNode: _focusNode,
              controller: _controller,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                changeState(value);
              },
            ))
      ],
    ));
  }

  // Widget mainInput() {
  //   return Column(
  //     children: [
  //       inputRow(
  //           "변경할 닉네임을 입력하세요", _nameInputFocusNode, _nameInputController,
  //           (val) {
  //         setState(
  //           () {
  //             name = val;
  //           },
  //         );
  //       }, "name"),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserState>(context, listen: false);
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: '${userState.name}님의 정보 변경',
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
                      child: inputRow("변경할 닉네임을 입력하세요", _nameInputFocusNode,
                          _nameInputController, (val) {
                        setState(
                          () {
                            name = val;
                          },
                        );
                      }, "email"),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: DefaultComponents.achive50(), width: 3.0),
                          borderRadius: BorderRadius.circular(20)),
                    )),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                    onTap: () async {
                      var userState =
                          Provider.of<UserState>(context, listen: false);
                      if (name == '' || name == null) {
                        return await MMBUtils.oneButtonAlert(
                            context, "", "필수 입력을 확인하세요");
                      }
                      await MMBUtils.twoButtonAlert(
                          context, '변경하기', '변경하시겠습니까?', () async {
                        Map changeInfo = {
                          "name": name,
                          "pwd": userState.pwd,
                          "type": 'name'
                        };
                        bool patchResult = await AuthUtils.changeMemberInfo(
                            context, changeInfo);
                        if (!patchResult) {
                          return MMBUtils.oneButtonAlert(
                              context, "", "변경에 실패했습니다. 다른 닉네임을 시도해보세요");
                        } else {
                          setState(() {});
                          Navigator.of(context).pop();
                          return MMBUtils.oneButtonAlert(
                              context, "", "변경되었습니다!");
                        }
                      });
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
                          '변경',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )))
              ],
            )));
  }
}
