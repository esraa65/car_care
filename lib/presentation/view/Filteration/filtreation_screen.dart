import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_assets.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/core/extensions/media_query.dart';
import 'package:car_care/presentation/cubit/filteration/filteration_cubit.dart';
import 'package:car_care/presentation/cubit/filteration/filteration_state.dart';
import 'package:car_care/presentation/widget/custom/custom_app_bar.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/filteration/custom_rating.dart';
import 'package:car_care/presentation/widget/filteration/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../widget/custom/default_text.dart';
import '../../widget/filteration/custom_container_drop_down.dart';
import '../../widget/filteration/custom_filteration_row.dart';
import '../../widget/filteration/custom_from_to_row.dart';
import '../../widget/filteration/custom_list_view_body_container.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterationCubit(),
      child: BlocBuilder<FilterationCubit, FilterationState>(
        builder: (context, state) {
          final cubit = context.read<FilterationCubit>();
          return Scaffold(
            appBar: appBar(title: "الفلتر"),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const DefaultText(
                            text: "الموقع",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black33,
                          ),
                          height(4),
                          const CustomContainerDropDown(),
                          height(16),
                          const CustomFilterationRow(
                            assetName: AppAssets.filteration,
                            text: "الفلتر",
                          ),
                          height(16),
                          //! Services Filters
                          const DefaultText(
                            text: "الخدمات",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black33,
                          ),
                          height(8),
                          SizedBox(
                            height: context.h * 0.05,
                            width: context.w,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CustomListViewBodyContainer(
                                    index: index,
                                    text: cubit.service[index],
                                    containerColor: cubit.currentIndex == index
                                        ? AppColors.primary
                                        : AppColors.greyEEE,
                                    textColor: cubit.currentIndex == index
                                        ? AppColors.white
                                        : AppColors.grey9c,
                                    onTap: () {
                                      cubit.changeIndex(index);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) => width(8),
                                itemCount: cubit.service.length,
                              ),
                            ),
                          ),
                          height(16),
                          //! Price Range Slider
                          const DefaultText(
                            text: "نطاق السعر",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          height(16),
                          const CustomFromToRow(),
                          const CustomSlider(),
                          height(16),

                          //! Rating Filter
                          const DefaultText(
                            text: "التقييم",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black33,
                          ),
                          height(8),
                          const CustomRating(),
                          height(16),

                          //! Sort and Filter Options
                          const CustomFilterationRow(
                            assetName: AppAssets.mdiSort,
                            text: "فرز",
                          ),

                          height(16),
                          SizedBox(
                            height: context.h * 0.05,
                            width: context.w,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CustomListViewBodyContainer(
                                    index: index,
                                    text: cubit.sort[index],
                                    onTap: () {
                                      cubit.changeSortIndex(index);
                                    },
                                    containerColor: cubit.sortIndex == index
                                        ? AppColors.primary
                                        : AppColors.greyEEE,
                                    textColor: cubit.sortIndex == index
                                        ? AppColors.white
                                        : AppColors.grey9c,
                                  );
                                },
                                separatorBuilder: (context, index) => width(8),
                                itemCount: cubit.sort.length,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                //! Reset and Submit Buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Flexible(
                        child: DefaultButton(
                          width: double.maxFinite,
                          title: "إعادة تعيين",
                          onPressed: () {},
                          textColor: AppColors.black,
                          containerColor: AppColors.greyEB,
                        ),
                      ),
                      width(50),
                      Flexible(
                        child: DefaultButton(
                          width: double.maxFinite,
                          title: "تقدم",
                          onPressed: () {
                            context.pushNamed(Routes.workShop);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
