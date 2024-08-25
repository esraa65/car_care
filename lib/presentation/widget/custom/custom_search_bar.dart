import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey9c),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey9c),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey9c),
        ),
        hintText: "بحث",
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(color: AppColors.grey9c),
        suffixIcon: Icon(Icons.search, color: AppColors.grey9c),
      ),
    );
  }
}
