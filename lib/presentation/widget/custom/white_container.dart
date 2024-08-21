import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final Widget widget;
  const WhiteContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.15,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: widget,
        ));
  }
}
