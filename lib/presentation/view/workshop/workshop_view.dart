import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/location_row_widget.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:car_care/presentation/widget/workshop/switch_widget.dart';
import 'package:car_care/presentation/widget/workshop/workshop_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopView extends StatelessWidget {
  const WorkshopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          const CustomArrowBack(),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: LocationRowWidget(),
          ),
          //   const SizedBox(height: 16),
          //  const SearchAndFilterIcon(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: SwitchWidget(
              initialValue: true,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: DefaultText(
                text: 'مقدمي الخدمات',
                fontSize: 16,
                color: AppColors.grey4B,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
            builder: (context, state) {
              if (state is NearestWorkshopLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is NearestWorkshopSuccess) {
                return WorkshopListView(workshops: state.workshops);
              } else {
                return const Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 16),
          WhiteContainer(
              widget: DefaultButton(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  containerColor: AppColors.primary,
                  title: '"اقترح علي مركز صيانة"',
                  onPressed: () {}))
        ],
      ),
    );
  }
}
