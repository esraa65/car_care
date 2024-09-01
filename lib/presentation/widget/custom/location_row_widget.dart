import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/map/map_state.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/map/map_cubit.dart';

class LocationRowWidget extends StatelessWidget {
  final String? location;
  const LocationRowWidget({super.key, this.location});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final cubit = context.read<MapCubit>();
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.black),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(8),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primary,
                  ),
                  dropdownColor: AppColors.white,
                  value: 'fortuner',
                  items: const [
                    DropdownMenuItem(
                      value: 'fortuner',
                      child: DefaultText(text: 'fortuner'),
                    ),
                    // Add more items here
                  ],
                  onChanged: (value) {
                    // Handle change
                  },
                ),
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.orange,
                )),
            Flexible(
              flex: 3,
              child: DefaultText(
                text: cubit.locationString ?? '',
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.orange,
              ),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
