import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/Utils/AuthUtils.dart';
import 'package:make_me_better_mandalart_fe/Utils/CommonUtils.dart';
import 'package:make_me_better_mandalart_fe/View/Welcome.dart';
import 'package:make_me_better_mandalart_fe/View/MainPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationSwitcher extends StatefulWidget {
  @override
  _NavigationSwitcherState createState() => _NavigationSwitcherState();
}

class _NavigationSwitcherState extends State<NavigationSwitcher> {
  @override
  void initState() {
    super.initState();
    _initState();
  }

  Future<void> _initState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var state = Provider.of<NavigationState>(context, listen: false);
    String? useremail = await prefs.getString('@email');
    String? pwd = await prefs.getString('@password');
    String? autoLogin = await prefs.getString('@autoLogin');

    if (autoLogin != null &&
        autoLogin != '' &&
        useremail != '' &&
        useremail != null &&
        pwd != null &&
        pwd != '') {
      bool loginResult =
          await AuthUtils.getToken(context, {'email': useremail, 'password': pwd});
      if (!loginResult) {
        return MMBUtils.oneButtonAlert(context, "", "로그인에 실패했습니다. 다시 시도해 주세요");
      }
      state.changeState(NavigationStateEnum.home);
    } else {
      state.changeState(NavigationStateEnum.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<NavigationState>(context, listen: true);
    switchNavigation() {
      switch (state.state) {
        case NavigationStateEnum.none:
          return Center(
            child: CircularProgressIndicator(),
          );
        case NavigationStateEnum.auth:
          return Welcome();
        case NavigationStateEnum.home:
          return MainPage();
        default:
          MainPage();
      }
    }

    return Scaffold(
      body: switchNavigation(),
    );
  }
}
