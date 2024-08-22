import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/workshop/search_and_filter_icon.dart';
import 'package:flutter/material.dart';

class WorkshopView extends StatelessWidget {
  const WorkshopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DefaultText(text: 'مقدمى الخدمات'),
            SearchAndFilterIcon()
          ],
        ),
      ),
    );
  }
}
