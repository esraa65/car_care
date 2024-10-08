import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class GalleryWidget extends StatelessWidget {
  final List<String> pics;
  const GalleryWidget({
    super.key,
    required this.pics,
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
                const DefaultText(
                  text: "معرض الصور",
                  color: AppColors.grey4B,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const DefaultText(
                        text: "صورة",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.grey4B,
                      ),
                      DefaultText(
                        text: " (${pics.length})",
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ])
                  ],
                ),
              ],
            ),
            Expanded(
              child: AlignedGridView.count(
                itemCount: pics.length,
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemBuilder: (context, index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        pics[index],
                      ));
                },
              ),
            ),
            WhiteContainer(
                widget: DefaultButton(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    containerColor: AppColors.primary,
                    title: 'احجز ',
                    onPressed: () {
                          context.push(Routes.orderSummary);


                    }))
          ])),
    );
  }
}
