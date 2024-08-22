import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class IconWithContainer extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const IconWithContainer(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: AppColors.primary)),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: AppColors.primary)),
    );
  }
}
