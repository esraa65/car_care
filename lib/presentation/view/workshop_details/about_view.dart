import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:car_care/presentation/widget/workshop_details/icon_with_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutView extends StatelessWidget {
  final String description;
  const AboutView({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const DefaultText(
            text: "عن المركز",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey4B,
          ),
          height(12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
            ),
            child: DefaultText(
              text: description,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey4B,
            ),
          ),
          height(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconWithContainerWidget(
                icon: Icons.messenger_sharp,
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              IconWithContainerWidget(
                icon: Icons.call,
                onPressed: () {},
              )
            ],
          ),
          const Spacer(),
          WhiteContainer(
              widget: DefaultButton(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  containerColor: AppColors.primary,
                  title: 'احجز ',
                  onPressed: () {
                    context.push(Routes.orderSummary);
                  }))
        ],
      ),
    );
  }
}
