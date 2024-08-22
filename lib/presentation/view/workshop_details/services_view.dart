import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ServiceCheckbox(title: 'ddd', value: true, onChanged: (value) {}),
    );
  }
}

class ServiceCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const ServiceCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyD9), // Set the border color
        borderRadius:
            BorderRadius.circular(10), // Optional: Set the border radius
      ),
      child: Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: DefaultText(text: title),
              value: value,
              onChanged: onChanged,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: AppColors.primary,
            ),
          ),
          Image.network(
            'https://via.placeholder.com/150',
            fit: BoxFit.scaleDown,
            width: 40,
            height: 40,
          ),
          width(2),
        ],
      ),
    );
  }
}
