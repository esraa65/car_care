import 'package:car_care/presentation/cubit/filteration/filteration_cubit.dart';
import 'package:car_care/presentation/cubit/filteration/filteration_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterationCubit, FilterationState>(
      builder: (context, state) {
        final cubit = context.read<FilterationCubit>();
        return RangeSlider(
          activeColor: AppColors.primary,
          values: RangeValues(cubit.minPrice, cubit.maxPrice),
          min: 100,
          max: 1000,
          divisions: 10,
          labels: RangeLabels(
            '${cubit.minPrice.round()} SAR',
            '${cubit.maxPrice.round()} SAR',
          ),
          onChanged: (RangeValues values) {
            cubit.sliderChange(values);
          },
        );
      },
    );
  }
}
