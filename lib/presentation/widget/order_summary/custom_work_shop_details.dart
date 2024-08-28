import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../custom/default_text.dart';

class CustomWorkShopDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomWorkShopDetails({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(
          text: subtitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.grey41,
        ),
        DefaultText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.grey9c,
        ),
      ],
    );
  }
}
