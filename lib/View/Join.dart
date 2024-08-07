import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/Utils/AuthUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CryptoUtils.dart';
import 'package:make_me_better_mandalart_fe/View/BoardRegister.dart';
import 'package:make_me_better_mandalart_fe/View/Login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Join extends StatefulWidget {
  @override
  _Join createState() => _Join();
}

class _Join extends State<Join> {
  final scrollerControoer = ScrollController();
  final nickNameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdChkController = TextEditingController();

  final nickNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  final _nickNameInputFocusNode = FocusNode();
  final _emailInputFocusNode = FocusNode();
  final _pwdInputFocusNode = FocusNode();
  final _pwdChkInputFocusNode = FocusNode();
  final _nickNameInputController = TextEditingController();
  final _emailInputController = TextEditingController();
  final _pwdInputController = TextEditingController();
  final _pwdChkInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String pwd = '';
  String pwdChk = '';

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
    } else if (type == 'email' &&
        (!_controller.text.contains('@') || !_controller.text.contains('.'))) {
      return '이메일 형식을 확인하세요';
    } else if (type == 'pwd' && !_controller.text.contains(RegExp(r'[0-9]'))) {
      return '숫자를 포함해야 합니다';
    } else if (type == 'pwd' &&
        !_controller.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '특수문자를 포함해야 합니다';
    } else if (type == 'pwd' && pwd != pwdChk) {
      return '비밀번호가 일치하지 않습니다';
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
              validator: (val) {
                // if (val!.length == 0) {
                //   return '최소 한 글자 이상 입력해주세요';
                // }
                // if (type == 'email' &&
                //     (!val.contains('@') || !val.contains('.'))) {
                //   return '이메일 형식을 확인하세요';
                // }
                return;
              },
              // onSaved: (newValue) {
              //   changeState(newValue);
              // },
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
                // if (formKey.currentState!.validate()) {
                //   return;
                // } else {
                //   formKey.currentState!.save();
                changeState(value);
                // }
              },
            ))
      ],
    ));
  }

  Widget mainInput() {
    return Column(
      children: [
        inputRow(
            "닉네임을 입력하세요", _nickNameInputFocusNode, _nickNameInputController,
            (val) {
          setState(
            () {
              name = val;
            },
          );
        }, "text"),
        inputRow("이메일을 입력하세요", _emailInputFocusNode, _emailInputController,
            (val) {
          setState(
            () {
              email = val;
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
        inputRow(
            "비밀번호를 한번 더 입력하세요", _pwdChkInputFocusNode, _pwdChkInputController,
            (val) {
          setState(
            () {
              pwdChk = val;
            },
          );
        }, "pwd")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: '회원가입',
              leading: true,
              preventOnTap: true,
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      '이미 계정이 있으신가요?',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: DefaultComponents.achive50()),
                    )),
                InkWell(
                    onTap: () async {
                      setState(() {
                        showLoading = true;
                      });
                      if (name == '' ||
                          email == '' ||
                          pwd == '' ||
                          pwdChk == '') {
                        return await MMBUtils.oneButtonAlert(
                            context, "", "필수 입력을 확인하세요");
                      }
                      if (pwd != pwdChk) {
                        return await MMBUtils.oneButtonAlert(
                            context, "", "비밀번호를 확인하세요");
                      }
                      Map signupInfo = {
                        "name": name,
                        "email": email,
                        "pwd": getEncrypt(pwd),
                      };
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('@name', name);
                      await prefs.setString('@email', email);
                      await prefs.setString('@password', getEncrypt(pwd));

                      bool signupResult =
                          await AuthUtils.signup(context, signupInfo);
                      if (!signupResult) {
                        return;
                      }
                      setState(() {
                        showLoading = false;
                      });
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BoardRegister(modify: false)));
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
                          '회원가입',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )))
              ],
            )));
  }
}
