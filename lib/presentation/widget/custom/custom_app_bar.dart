import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:flutter/material.dart';

import 'default_text.dart';

PreferredSizeWidget appBar({
  required String title,
}) {
  return AppBar(
    title: DefaultText(
      text: title,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.grey4B,
    ),
    actions: const [
      CustomArrowBack(),
    ],
  );
}
