import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isCenter;
  // final TextStyle? googleFont;
  final FontWeight? fontWeight;
  final Color? color;
  final int maxLines;
  final TextOverflow textOverflow;
  final bool hasUnderline;

  const DefaultText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.isCenter = true,
    // this.googleFont,
    this.fontWeight,
    this.color,
    this.maxLines = 3,
    this.textOverflow = TextOverflow.ellipsis,
    this.hasUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenter ? TextAlign.center : TextAlign.right,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.black,
      ),
    );
  }
}
