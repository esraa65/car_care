import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';
import '../../cubit/car_care_cubit/car_care_cubit.dart';
import '../../cubit/car_care_cubit/car_care_state.dart';
import '../custom/default_text.dart';

class CustomContainerRow extends StatelessWidget {
  final int index;
  final String assetName;
  final String text;

  const CustomContainerRow({
    super.key,
    required this.index,
    required this.assetName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCareCubit, CarCareState>(
      builder: (context, state) {
        final cubit = context.read<CarCareCubit>();
        return InkWell(
          onTap: () {
            cubit.changeConatinerIndex(index);
          },
          child: AspectRatio(
            aspectRatio: 4 / 1.8,
            child: Container(
              decoration: BoxDecoration(
                color: cubit.selectedIndex == index
                    ? AppColors.primary
                    : AppColors.white,
                border: Border.all(
                  color: cubit.selectedIndex == index
                      ? AppColors.primary
                      : AppColors.grey9c,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  SvgPicture.asset(
                    assetName,
                    colorFilter: ColorFilter.mode(
                      cubit.selectedIndex == index
                          ? AppColors.white
                          : AppColors.grey9c,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Flexible(
                    child: FittedBox(
                      child: DefaultText(
                        text: text,
                        color: cubit.selectedIndex == index
                            ? AppColors.white
                            : AppColors.grey9c,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
