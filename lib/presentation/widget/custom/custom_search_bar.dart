import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final double? borderRadius;
  final Color? borderColor;

  const CustomSearchBar({
    super.key,
    this.hintText,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 0),
          ),
          borderSide: const BorderSide(color: AppColors.grey9c),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          borderSide: BorderSide(color: borderColor ?? AppColors.grey9c),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          borderSide: BorderSide(color: borderColor ?? AppColors.grey9c),
        ),
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(color: AppColors.grey9c),
        suffixIcon: const Icon(Icons.search, color: AppColors.grey9c),
      ),
    );
  }
}
