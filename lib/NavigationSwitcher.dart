import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/View/Login.dart';
import 'package:make_me_better_mandalart_fe/View/MainPage.dart';
import 'package:provider/provider.dart';

class NavigationSwitcher extends StatefulWidget {
  @override
  _NavigationSwitcherState createState() => _NavigationSwitcherState();
}

class _NavigationSwitcherState extends State<NavigationSwitcher> {
  @override
  void initState() {
    super.initState();
    // _initState();
  }

  // void _initState() {
  //   var state = Provider.of<NavigationState>(context, listen: false);
  // state.changeState(NavigationStateEnum.auth);
  //   state.changeState(NavigationStateEnum.home);
  // }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<NavigationState>(context, listen: false);
    state.changeState(NavigationStateEnum.auth);
    switchNavigation() {
      switch (state.state) {
        case NavigationStateEnum.none:
          return Center(
            child: CircularProgressIndicator(),
          );
        case NavigationStateEnum.auth:
          return Login();
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
