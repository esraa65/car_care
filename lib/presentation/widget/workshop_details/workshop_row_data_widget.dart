import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class WorkshopRowDataWidget extends StatelessWidget {
  const WorkshopRowDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: AppColors.orange),
                          width(8),
                          const DefaultText(
                              text: '4.8', color: AppColors.black),
                          width(8),
                          const DefaultText(
                              text: '(365 تقييم)', color: AppColors.grey4B)
                        ],
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const DefaultText(
                            text: 'اطارات',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height(8),
                  const DefaultText(
                      text: 'اوتو كار سيرفيس',
                      fontSize: 24,
                      color: AppColors.black),
                  height(8),
                  const DefaultText(
                      text: 'السعودية , الرياض 20 شارع العليا',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey9c),
                ],
              ),
        
        
            );
  }
}