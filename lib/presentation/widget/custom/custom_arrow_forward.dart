import 'package:car_care/app/routing/app_routing.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBack extends StatelessWidget {
  final void Function()? onPressed;
  const CustomArrowBack({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed ??
            () {
              context.pop();
            },
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: AppColors.white,
        ),
      ),
    );
  }
}
