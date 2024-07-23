import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';

class ChangeMyInfo extends StatefulWidget {
  @override
  _ChangeMyInfo createState() => _ChangeMyInfo();
}

class _ChangeMyInfo extends State<ChangeMyInfo> {
  final nickNameController = TextEditingController();
  final pwdController = TextEditingController();

  final nickNameFocusNode = FocusNode();

  final _nickNameInputFocusNode = FocusNode();
  final _pwdInputFocusNode = FocusNode();
  final _nickNameInputController = TextEditingController();
  final _pwdInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nickName = '';
  String pwd = '';

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
              obscureText: type == 'pwd' ? true : false,
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
                          color: DefaultComponents.achive50(), width: 2.0)),
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
        inputRow(
            "변경할 닉네임을 입력하세요", _nickNameInputFocusNode, _nickNameInputController,
            (val) {
          setState(
            () {
              nickName = val;
            },
          );
        }, "email"),
        inputRow("비밀번호를 입력하세요", _pwdInputFocusNode, _pwdInputController, (val) {
          setState(
            () {
              pwd = val;
            },
          );
        }, "pwd"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: '내 정보 변경',
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
                  height: 50,
                ),
                InkWell(
                    onTap: () async {
                      if (nickName == '' || pwd == '') {
                        return await MMBUtils.oneButtonAlert(
                            context, "", "필수 입력을 확인하세요");
                      }
                      await MMBUtils.twoButtonAlert(
                          context, '변경하기', '변경하시겠습니까?', () {
                      //  await AuthUtils.
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
