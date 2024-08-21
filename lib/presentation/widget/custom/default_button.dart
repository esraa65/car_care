import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.height,
    this.width,
    this.radius,
    required this.title,
    this.textColor,
    this.containerColor,
    this.borderColor,
    required this.onPressed,
    this.fontWeight,
    this.loading = false,
    this.padding,
    this.margin,
  });

  final double? height;
  final double? width;
  final double? radius;
  final String title;
  final Color? textColor;
  final Color? containerColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final FontWeight? fontWeight;
  final bool loading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: containerColor ?? AppColors.blue,
          borderRadius: BorderRadius.circular(radius ?? 24),
          border: Border.all(color: borderColor ?? AppColors.white)),
      child: TextButton(
        onPressed: onPressed,
        child: loading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: TextStyle(
                    color: textColor ?? AppColors.white,
                    fontSize: 16,
                    fontWeight: fontWeight ?? FontWeight.w700),
              ),
      ),
    );
  }
}
