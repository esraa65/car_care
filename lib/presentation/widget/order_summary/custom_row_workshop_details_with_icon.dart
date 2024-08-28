import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../custom/default_text.dart';

class CustomRowWorkshopDetailsWithIcon extends StatelessWidget {
  final String title;
  final String price;
  const CustomRowWorkshopDetailsWithIcon(
      {super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_forever_outlined,
                color: AppColors.red,
              ),
            ),
            width(8),
            DefaultText(
              text: price,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grey41,
            ),
          ],
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
