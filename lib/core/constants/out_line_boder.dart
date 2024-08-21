import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

InputBorder outLineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.white,
      ));
}
