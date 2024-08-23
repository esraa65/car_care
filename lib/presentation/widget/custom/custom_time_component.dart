import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/core/extensions/extensions.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class CustomTimeComponent extends StatefulWidget {
  final IconData icon;
  final TimeOfDay? initialTime;
  const CustomTimeComponent({
    super.key,
    required this.icon,
    this.initialTime,
  });

  @override
  State<CustomTimeComponent> createState() => _TimeComponentState();
}

class _TimeComponentState extends State<CustomTimeComponent> {
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime ?? TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greyE2),
      ),
      child: Row(
        children: [
          DefaultText(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.grey4B,
            text: selectedTime != null
                ? '${selectedTime!.hourOfPeriod}:${selectedTime!.minute.toString().padLeft(2, '0')} ${selectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}'
                : 'Select Time',
          ),
          width(20),
          Icon(
            widget.icon,
            color: AppColors.primary,
            size: 24,
          ),
        ],
      ),
    ).onTap(() async {
      TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime!,
      );
      if (picked != null && picked != selectedTime) {
        setState(() {
          selectedTime = picked;
        });
      }
    });
  }
}
