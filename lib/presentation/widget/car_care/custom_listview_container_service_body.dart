import 'package:car_care/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../custom/default_text.dart';

class CustomListviewContainerServiceBody extends StatelessWidget {
  final String text;
  const CustomListviewContainerServiceBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey5D),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              checkColor: AppColors.white,
              activeColor: AppColors.primary,
              value: true,
              onChanged: (val) {},
            ),
            Row(
              children: [
                DefaultText(
                  text: text,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                width(16),
                SvgPicture.asset(AppAssets.carDoor),
              ],
            ),
          ],
        ));
  }
}
