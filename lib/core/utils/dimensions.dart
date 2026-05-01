import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQuery;
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;
  }
}