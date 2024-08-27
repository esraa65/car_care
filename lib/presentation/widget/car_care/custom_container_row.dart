import 'package:car_care/presentation/cubit/app_cubit/app_cubit.dart';
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
    return BlocBuilder<CarCareCubit, CarCareState>(builder: (context, state) {
      final appCubit = context.read<AppCubit>();
      return ValueListenableBuilder(
          valueListenable: appCubit.selectedIndex,
          builder: (context, value, child) {
            return InkWell(
              onTap: () {
                appCubit.changeConatinerIndex(index);
              },
              child: AspectRatio(
                aspectRatio: 4 / 1.8,
                child: Container(
                  decoration: BoxDecoration(
                    color: appCubit.selectedIndex.value == index
                        ? AppColors.primary
                        : AppColors.white,
                    border: Border.all(
                      color: appCubit.selectedIndex.value == index
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
                          appCubit.selectedIndex.value == index
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
                            color: appCubit.selectedIndex.value == index
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
          });
    });
  }
}
