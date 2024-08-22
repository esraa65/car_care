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
    return SizedBox(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  DefaultText(
                    text: "gallery",
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
            DefaultText(
              text: "viewAll",
              color: AppColors.grey4B,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            AlignedGridView.count(
              crossAxisCount: 3, // Adjust the number of columns as needed
              crossAxisSpacing: 16, // Spacing between columns
              mainAxisSpacing: 16, // Spacing between rows
              itemCount: 2,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                "",
                  fit: BoxFit.cover, // Ensure the image covers the area
                ),
              ),
            ),
          ])),
    );
  }
}
