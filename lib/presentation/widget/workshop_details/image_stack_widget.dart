import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:flutter/material.dart';

class ImageStackWidget extends StatelessWidget {
  const ImageStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      // Add more URLs here
    ];
    return Stack(
      children: [
        Image.network(
          'https://via.placeholder.com/150',
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 24,
          left: 10,
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: const Icon(Icons.share, color: AppColors.grey5D)),
              const SizedBox(width: 8),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: const Icon(Icons.bookmark_border,
                      color: AppColors.grey5D)),
            ],
          ),
        ),
        const Positioned(top: 24, right: 10, child: CustomArrowBack()),
        Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.07,
              padding: const EdgeInsets.all(4.0),
              margin: const EdgeInsets.all(4.0),
              color: AppColors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.fill,
                        width: MediaQuery.sizeOf(context).width *
                            0.16, // Adjust width for images
                      ),
                    ),
                  );
                },
              ),
            ))
      ],
    );
  }
}
