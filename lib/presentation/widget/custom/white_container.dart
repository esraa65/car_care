import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final Widget widget;
  final double? height;
  const WhiteContainer({super.key, required this.widget, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width,
        height: height ?? MediaQuery.sizeOf(context).height * 0.11,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: widget,
        ));
  }
}
