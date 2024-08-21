import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  final void Function()? onPressed;
  const CustomArrowBack({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: AppColors.greyE0)),
      child:
          IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
    );
  }
}
