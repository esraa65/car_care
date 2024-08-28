import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_sizes.dart';
import '../custom/default_text.dart';

class CustomWorkshopImageRow extends StatelessWidget {
  const CustomWorkshopImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const DefaultText(
          text: 'اوتو كار سيرفس',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        width(50),
        Image.asset(AppAssets.workshop),
      ],
    );
  }
}
