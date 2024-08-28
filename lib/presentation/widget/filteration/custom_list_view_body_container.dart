import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class CustomListViewBodyContainer extends StatelessWidget {
  final int index;
  final Function() onTap;
  final String text;
  final Color? containerColor;
  final Color? textColor;
  const CustomListViewBodyContainer({
    super.key,
    required this.index,
    required this.text,
    required this.onTap,
    this.containerColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: DefaultText(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
