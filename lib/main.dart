import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:make_me_better_mandalart_fe/Components/DefaultComponents.dart';
import 'package:make_me_better_mandalart_fe/NavigationSwitcher.dart';
import 'package:make_me_better_mandalart_fe/States/ActionState.dart';
import 'package:make_me_better_mandalart_fe/States/BoardState.dart';
import 'package:make_me_better_mandalart_fe/States/MissionState.dart';
import 'package:make_me_better_mandalart_fe/States/NavigationState.dart';
import 'package:make_me_better_mandalart_fe/States/UserState.dart';
import 'package:make_me_better_mandalart_fe/View/ActionRegister.dart';
import 'package:make_me_better_mandalart_fe/View/ChangeMyInfo.dart';
import 'package:make_me_better_mandalart_fe/View/Join.dart';
import 'package:make_me_better_mandalart_fe/View/Login.dart';
import 'package:make_me_better_mandalart_fe/View/MainPage.dart';
import 'package:make_me_better_mandalart_fe/View/MissionRegister.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationState>(
          create: (context) => NavigationState(),
        ),
        ChangeNotifierProvider<ActionState>(
          create: (context) => ActionState(),
        ),
        ChangeNotifierProvider<BoardState>(
          create: (context) => BoardState(),
        ),
        ChangeNotifierProvider<MissionState>(
          create: (context) => MissionState(),
        ),
        ChangeNotifierProvider<UserState>(
          create: (context) => UserState(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'make me better',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            scaffoldBackgroundColor: DefaultComponents.black(),
            fontFamily: 'Pretendard',
            useMaterial3: true,
          ),
          home: MainPage()
          // ActionRegister(
          //   modify: false,
          // )
          //     FlutterSplashScreen.fadeIn(
          //   backgroundColor: DefaultComponents.black(),
          //   onInit: () {
          //     print("On Init");
          //   },
          //   onEnd: () {
          //     print("On End");
          //   },
          //   childWidget: SizedBox(
          //     child: Image.asset(
          //       'icons/taegu_sunhwa.jpeg',
          //     ),
          //   ),
          //   onAnimationEnd: () => print("On Fade In End"),
          //   nextScreen: NavigationSwitcher(),
          // )
          ),
    );
  }
}
