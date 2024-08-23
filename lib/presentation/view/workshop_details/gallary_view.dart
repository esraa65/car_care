import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
  });

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
    return SizedBox(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            height(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: "viewAll",
                  color: AppColors.grey4B,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      DefaultText(
                        text: "صورة",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.grey4B,
                      ),
                      DefaultText(
                        text: " (${2})",
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ])
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: AlignedGridView.count(
                itemCount: imageUrls.length,
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemBuilder: (context, index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(imageUrls[index]));
                },
              ),
            )
          ])),
    );
  }
}
