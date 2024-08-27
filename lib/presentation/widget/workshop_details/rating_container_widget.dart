import 'package:flutter/material.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';

class RatingContainerWidget extends StatelessWidget {
  final String name;
  final String maintainType;
  final String pic;
  final String date;
  final String review;
  const RatingContainerWidget({
    super.key,
    required this.name,
    required this.maintainType,
    required this.pic,
    required this.date,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey4B, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                text: maintainType,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.grey4B,
              ),
              Row(
                children: [
                  DefaultText(
                    text: name,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey4B,
                  ),
                  width(6),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(pic, width: 60, height: 60)),
                ],
              ),
            ],
          ),
          height(12),
          DefaultText(
            text: date,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.grey4B,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.star, color: AppColors.orange),
                  Icon(Icons.star, color: AppColors.orange),
                  Icon(Icons.star, color: AppColors.orange),
                  Icon(Icons.star, color: AppColors.orange),
                ],
              ),
              DefaultText(
                text: review,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey4B,
              ),
            ],
          )
        ],
      ),
    );
  }
}
