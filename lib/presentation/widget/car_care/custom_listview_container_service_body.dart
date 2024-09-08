import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/presentation/cubit/car_care_cubit/car_care_cubit.dart';
import 'package:car_care/presentation/cubit/car_care_cubit/car_care_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../custom/default_text.dart';

class CustomListviewContainerServiceBody extends StatefulWidget {
  final String text;
  final String? assetName;
  final void Function(bool?)? onChanged;
  final bool value;
  final String? selectedService;
  const CustomListviewContainerServiceBody({
    super.key,
    required this.text,
    this.assetName,
    this.onChanged,
    required this.value,
    this.selectedService,
  });

  @override
  State<CustomListviewContainerServiceBody> createState() =>
      _CustomListviewContainerServiceBodyState();
}

class _CustomListviewContainerServiceBodyState
    extends State<CustomListviewContainerServiceBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCareCubit, CarCareState>(
      builder: (context, state) {
        final cubit = context.read<CarCareCubit>();
        return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey5D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    checkColor: AppColors.white,
                    activeColor: AppColors.primary,
                    value: cubit.isChecked,
                    onChanged: (val) {
                      setState(() {
                        cubit.isChecked = val!;
                      });
                      widget.onChanged?.call(val);
                    }),
                Row(
                  children: [
                    DefaultText(
                      text: widget.text,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    width(16),
                    SvgPicture.network(
                      widget.assetName ?? AppAssets.carDoor,
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
