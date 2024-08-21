import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

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

class IconWithContainer extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const IconWithContainer(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: AppColors.primary)),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: AppColors.primary)),
    );
  }
}
