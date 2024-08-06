import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/CustomAppbar.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/Utils/AuthUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CryptoUtils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  final emailFocusNode = FocusNode();

  final _emailInputFocusNode = FocusNode();
  final _pwdInputFocusNode = FocusNode();
  final _emailInputController = TextEditingController();
  final _pwdInputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String pwd = '';

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      setState(() {
        email = 'aridoasis@naver.com';
        pwd = 'lovely91!';
      });
    }
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

  Widget mainInput() {
    return Column(
      children: [
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _dismissKeyboard(),
        child: Scaffold(
            appBar: CustomAppbar(
              title: '로그인',
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
                    onTap: () async {
                      var navigationState =
                          Provider.of<NavigationState>(context, listen: false);
                      if (email == '' || pwd == '') {
                        return await MMBUtils.oneButtonAlert(
                            context, "", "필수 입력을 확인하세요");
                      }
                      Map loginInfo = {
                        "email": email,
                        "pwd": getEncrypt(pwd),
                      };
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('@email', email);
                      await prefs.setString('@password', getEncrypt(pwd));

                      bool loginResult =
                          await AuthUtils.getToken(context, loginInfo);
                      if (!loginResult) {
                        return;
                      }
                      bool getAuthUserResult = await AuthUtils.login(context);
                      if (!getAuthUserResult) {
                        return;
                      }
                      navigationState.changeState(NavigationStateEnum.home);
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
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
                          '로그인',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )))
              ],
            )));
  }
}
