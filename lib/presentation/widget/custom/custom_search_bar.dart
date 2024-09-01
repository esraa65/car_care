import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final double? borderRadius;
  final Color? borderColor;
  final TextEditingController? searchController;
  final VoidCallback? onSearchChanged;

  const CustomSearchBar({
    super.key,
    this.hintText,
    this.borderRadius,
    this.borderColor,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
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
      onChanged: (value) =>
          onSearchChanged!(), // Trigger the search when the text changes
    );
  }
}
