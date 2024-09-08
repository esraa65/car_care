import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  Color? color, {
  required String msg,
}) {
  Fluttertoast.showToast(
    toastLength: Toast.LENGTH_LONG,
    msg: msg,
    backgroundColor: color,
    fontSize: 16,
    textColor: AppColors.white,
  );
}
