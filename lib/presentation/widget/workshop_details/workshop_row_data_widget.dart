import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class WorkshopRowDataWidget extends StatelessWidget {
  final String rating;
  final String reviewCount;
  final String category;
  final String workshopName;
  final String location;
  const WorkshopRowDataWidget(
      {super.key,
      required this.rating,
      required this.reviewCount,
      required this.category,
      required this.workshopName,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  DefaultText(text: rating, color: AppColors.black),
                  width(8),
                  DefaultText(
                      text: '($reviewCount تقييم)', color: AppColors.grey4B)
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.35,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DefaultText(
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    text: category,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          height(8),
          DefaultText(text: workshopName, fontSize: 16, color: AppColors.black),
          height(8),
          DefaultText(
            text: location,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey9c,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
