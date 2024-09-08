import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_assets.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/dependency_injection.dart';
import 'package:car_care/presentation/cubit/car_care_cubit/car_care_cubit.dart';
import 'package:car_care/presentation/cubit/car_care_cubit/car_care_state.dart';
import 'package:car_care/presentation/widget/car_care/custom_row_check_box_and_text.dart';
import 'package:car_care/presentation/widget/custom/custom_date_component.dart';
import 'package:car_care/presentation/widget/custom/custom_time_component.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../widget/car_care/custom_container_row.dart';
import '../../widget/car_care/custom_listview_container_service_body.dart';
import '../../widget/custom/custom_app_bar.dart';
import '../../widget/custom/custom_flutter_show_toast.dart';
import '../../widget/custom/default_button.dart';
import '../../widget/custom/location_row_widget.dart';

class CarCareScreen extends StatefulWidget {
  final String type;
  const CarCareScreen({super.key, this.type = 'care'});

  @override
  State<CarCareScreen> createState() => _CarCareScreenState();
}

class _CarCareScreenState extends State<CarCareScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarCareCubit(getIt())..service(),
      child: BlocBuilder<CarCareCubit, CarCareState>(
        builder: (context, state) {
          final cubit = context.read<CarCareCubit>();

          if (state is CarCareSuccessState) {
            cubit.getservice = state.serviceEntity
                .where((element) => element.type == widget.type)
                .toList();
          }

          return Scaffold(
              appBar: appBar(title: "العناية بالسياره"),
              body: switch (state) {
                CarCareinitialState() =>
                  const Center(child: CircularProgressIndicator()),
                CarCareLoadingState() =>
                  const Center(child: CircularProgressIndicator()),
                CarCareFailureState(message: final message) => Center(
                    child: DefaultText(
                      text: message,
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                CarCareSuccessState(serviceEntity: final service) => Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const DefaultText(
                                text: "الموقع",
                                color: AppColors.teal08,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              const LocationRowWidget(),
                              height(16),
                              Row(
                                children: [
                                  const Expanded(
                                    child: CustomContainerRow(
                                      index: 1,
                                      assetName: AppAssets.carDoor,
                                      text: 'حماية وتظليل',
                                    ),
                                  ),
                                  width(16),
                                  const Expanded(
                                    child: CustomContainerRow(
                                      index: 0,
                                      assetName: AppAssets.car,
                                      text: "غسيل وتلميع",
                                    ),
                                  ),
                                ],
                              ),
                              height(16),
                              const CustomRowCheckboxAndText(),
                              height(16),
                              const DefaultText(
                                text: "الخدمات",
                                color: AppColors.grey4B,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              height(8),
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      height(8),
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        CustomListviewContainerServiceBody(
                                          value: cubit.getservice
                                              .contains(service[index]),
                                          text: cubit.getservice[index].arName,
                                          assetName: cubit
                                              .getservice[index].serviceImage,
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: cubit.getservice.length,
                                ),
                              ),
                              height(24),
                              const DefaultText(
                                text: "الوقت و التاريخ",
                                color: AppColors.grey4B,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              height(8),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTimeComponent(
                                      icon: Icons.access_time_filled),
                                  CustomDateComponent(
                                      icon: Icons.calendar_month),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      WhiteContainer(
                        widget: DefaultButton(
                          title: 'استمرار',
                          onPressed: () {
                            cubit.isChecked
                                ? context.push(Routes.mapScreen)
                                : showToast(AppColors.black,
                                    msg: "الرجاء اختيار خدمه اولا ");
                          },
                          width: double.infinity,
                        ),
                      )
                    ],
                  )
              });
        },
      ),
    );
  }
}
