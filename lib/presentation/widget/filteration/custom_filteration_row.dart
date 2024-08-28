import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class CustomFilterationRow extends StatelessWidget {
  final String text;
  final String assetName;
  const CustomFilterationRow({
    super.key,
    required this.text,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DefaultText(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        width(8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(assetName),
        )
      ],
    );
  }
}
