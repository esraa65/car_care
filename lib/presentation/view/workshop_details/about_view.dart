import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/workshop_details/icon_with_container.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const DefaultText(
            text: "description about workshop",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey4B,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconWithContainer(
                icon: Icons.messenger_sharp,
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              IconWithContainer(
                icon: Icons.call,
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
