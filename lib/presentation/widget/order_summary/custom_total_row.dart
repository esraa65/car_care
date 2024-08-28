import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../custom/default_text.dart';

class CustomTotalRow extends StatelessWidget {
  final String price;
  const CustomTotalRow({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(
          text: price,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.grey41,
        ),
        const DefaultText(
          text: "المجموع",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.grey9c,
        ),
      ],
    );
  }
}
