import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class WorkshopListView extends StatelessWidget {
  const WorkshopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.greyF2,
                  spreadRadius: 6,
                  blurRadius: 6,
                  offset: Offset(0, 11),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://via.placeholder.com/150', // Replace with actual image
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height * 0.18,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          left: 8,
                          top: 8,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                width(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: const DefaultText(
                                text: 'غسيل السيارات',
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.bookmark_outlined,
                              color: AppColors.primary,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const DefaultText(
                          text: 'اوتو كار سيرفس',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                      height(6),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: AppColors.primary,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              DefaultText(
                                text: '2 دقيقة',
                                color: AppColors.grey9c,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.primary,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              DefaultText(
                                text: '0.9 كم',
                                color: AppColors.grey9c,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                      height(6),
                      DefaultButton(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        radius: 24,
                        containerColor: AppColors.primary,
                        title: 'حجز',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
