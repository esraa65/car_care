import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';
import '../custom/default_text.dart';

class CustomWorkshopImageRow extends StatelessWidget {
  final String? workShopImage;
  final String? workshopName;

  const CustomWorkshopImageRow(
      {super.key, this.workShopImage, this.workshopName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DefaultText(
          text: workshopName ?? 'اوتو كار سيرفس',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        width(50),
        Image.network(
          workShopImage ?? 'https://placehold.co/600x400.png',
          height: 150,
          width: 150,
        ),
      ],
    );
  }
}
