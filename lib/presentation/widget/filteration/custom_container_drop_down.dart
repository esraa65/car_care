import 'package:car_care/presentation/cubit/filteration/filteration_cubit.dart';
import 'package:car_care/presentation/cubit/filteration/filteration_state.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';

class CustomContainerDropDown extends StatelessWidget {
  const CustomContainerDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterationCubit, FilterationState>(
      builder: (context, state) {
        final cubit = context.read<FilterationCubit>();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.greyEEE,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            underline: Container(),
            hint: const DefaultText(
              text: 'اختر موقع',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey9c,
            ),
            value: cubit.selectedLocation,
            items: cubit.locations.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              cubit.changeDropDownValue(newValue);
            },
            isExpanded: true,
          ),
        );
      },
    );
  }
}
