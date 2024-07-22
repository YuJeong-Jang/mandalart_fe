import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultComponents {
  late BuildContext context;

  static Color achive25({opacity = 1}) {
    return Color.fromRGBO(57, 211, 83, opacity);
  }
  static Color achive50({opacity = 1}) {
    return Color.fromRGBO(38, 166, 65, opacity);
  }
  static Color achive75({opacity = 1}) {
    return Color.fromRGBO(1, 108, 49, opacity);
  }
  static Color achive100({opacity = 1}) {
    return Color.fromRGBO(13, 68, 41, opacity);
  }

  static Color black({opacity = 1}) {
    return Color.fromRGBO(0, 0, 0, opacity);
  }

}
