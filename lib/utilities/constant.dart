import 'package:flutter/material.dart';

Color blue1 = const Color(0xFF171D3C);
Color blue2 = const Color(0xFF147AD6);
Color pink1 = const Color(0xFFEC6666);
Color cyan1 = const Color(0xFF79D2DE);
Color green1 = const Color(0xFF3CD942);
Color grey1 = const Color(0xFF717588);
Color grey2 = const Color(0xffB4B9D1);
Color grey3 = const Color(0xFF7C828A);
Color grey4 = const Color(0xFF9F9F9F);
Color grey5 = const Color(0xFF707070);
Color grey6 = const Color(0xFFCED5E1);

class Config {
  BuildContext context;
  Config(this.context);
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get textScaleFactor => MediaQuery.of(context).textScaleFactor;
}

String womanStandingNearBlueGateUrl =
    'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80';

class ImageAssets {
  static const String user = "assets/images/user.png";
  static const String userProfile = "assets/images/user_profile.png";
  static const String bell = "assets/images/bell.svg";
  static const String menu = "assets/images/menu.svg";
  static const String checkCircle = "assets/images/check_circle_fill.png";
  static const String processCircle = "assets/images/in_progress.png";
  static const String card1 = "assets/images/visa_card1.png";
  static const String card2 = "assets/images/visa_card2.png";
  static const String arrowRight = "assets/images/arrow_right.svg";
  static const String arrowUp = "assets/images/arrow_up.svg";
}
