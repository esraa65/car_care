
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/out_line_boder.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData themeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        errorBorder: outLineInputBorder(),
        focusedErrorBorder: outLineInputBorder(),
        enabledBorder: outLineInputBorder(),
        filled: true,
        fillColor: AppColors.white,
      ),
      fontFamily: 'JannaLT',
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }
}
