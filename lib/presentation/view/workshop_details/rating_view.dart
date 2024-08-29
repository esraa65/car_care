import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:car_care/presentation/widget/workshop_details/rating_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RatingView extends StatelessWidget {
  final String name;
  final String maintainType;
  final String pic;
  final String date;
  final String review;
  const RatingView(
      {super.key,
      required this.name,
      required this.maintainType,
      required this.pic,
      required this.date,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const DefaultText(
          text: "التقييمات",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        height(12),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) {
              return RatingContainerWidget(
                  name: name,
                  maintainType: maintainType,
                  pic: pic,
                  date: date,
                  review: review);
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
      ]),
    ));
  }
}
