import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.darkGreyColor,
      appBarTheme: AppBarThemeData(
        backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: AppColors.yellowColor
          )
      )
  );
}