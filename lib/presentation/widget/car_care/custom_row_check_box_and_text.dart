import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/cubit/car_care_cubit/car_care_state.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/car_care_cubit/car_care_cubit.dart';

class CustomRowCheckboxAndText extends StatefulWidget {
  const CustomRowCheckboxAndText({super.key});

  @override
  State<CustomRowCheckboxAndText> createState() =>
      _CustomRowCheckboxAndTextState();
}

class _CustomRowCheckboxAndTextState extends State<CustomRowCheckboxAndText> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCareCubit, CarCareState>(
      builder: (context, state) {
        final cubit = context.read<CarCareCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
                checkColor: AppColors.white,
                activeColor: AppColors.primary,
                value: cubit.isChecked,
                onChanged: (val) {
                  setState(() {
                    cubit.isChecked = val!;
                  });
                }),
            width(4),
            const DefaultText(
              text: "تقديم الخدمة فى مكانك",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey4B,
            ),
          ],
        );
      },
    );
  }
}
