import 'package:car_care/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class CustomDateComponent extends StatefulWidget {
  final IconData icon;
  final DateTime? initialDate;
  const CustomDateComponent({
    super.key,
    required this.icon,
    this.initialDate,
  });

  @override
  State<CustomDateComponent> createState() => _CustomDateComponentState();
}

class _CustomDateComponentState extends State<CustomDateComponent> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
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
          Text(
            selectedDate != null
                ? DateFormat('d MMM yyyy').format(selectedDate!)
                : '',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.grey4B),
          ),
          width(24),
          Icon(
            widget.icon,
            color: AppColors.primary,
            size: 24,
          ),
        ],
      ),
    ).onTap(() async {
      DateTime? picked = await showDatePicker(
          context: context,
          firstDate: DateTime(2001),
          initialDate: selectedDate!,
          lastDate: DateTime(2025));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    });
  }
}
