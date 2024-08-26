import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class ListServicesWidget extends StatelessWidget {
  final String title;
  final String pic;
  final bool value;
  final ValueChanged<bool?> onChanged;
  const ListServicesWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged,
      required this.pic});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyD9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              checkColor: AppColors.white,
              activeColor: AppColors.primary,
              value: value,
              onChanged: onChanged,
            ),
            DefaultText(text: title),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  pic,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://via.placeholder.com/40', // Fallback image URL
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    );
                  },
                )),
          ],
        ));
  }
}
