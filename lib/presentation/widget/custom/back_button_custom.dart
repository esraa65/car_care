import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.greyD8, width: 3),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blue,
            size: 24,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
