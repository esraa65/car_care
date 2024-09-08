import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/dependency_injection.dart';
import 'package:car_care/domain/entity/workshops/nearest_work_shop_entity.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/cubit/workshop/reserve_workshop/reserve_workshop_cubit.dart';
import 'package:car_care/presentation/widget/custom/custom_flutter_show_toast.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../cubit/workshop/reserve_workshop/resrve_workshop_state.dart';

class WorkshopListView extends StatelessWidget {
  final List<WorkshopsEntity> workshops;
  const WorkshopListView({super.key, required this.workshops});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
        builder: (context, state) {
      if (state is NearestWorkshopLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is NearestWorkshopSuccess) {
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: workshops.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.workshopDetailsView,
                      pathParameters: {"id": workshops[index].id.toString()});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.only(bottom: 12, right: 12, left: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.greyF2,
                        spreadRadius: 6,
                        blurRadius: 6,
                        offset: Offset(0, 11),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  workshops[index].logo ??
                                      'https://via.placeholder.com/150', // Replace with actual image
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.18,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 8,
                                top: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        workshops[index].starRating.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      width(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: DefaultText(
                                      text: workshops[index]
                                              .services!
                                              .first
                                              .arName ??
                                          '',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.bookmark_outlined,
                                    color: AppColors.primary,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            DefaultText(
                                text: workshops[index].name ?? '',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                            height(6),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    DefaultText(
                                      text: '2 دقيقة',
                                      color: AppColors.grey9c,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    DefaultText(
                                      text: '0.9 كم',
                                      color: AppColors.grey9c,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            height(6),
                            BlocProvider(
                              create: (context) =>
                                  ReserveWorkshopCubit(getIt()),
                              child: BlocConsumer<ReserveWorkshopCubit,
                                  ResrveWorkshopState>(
                                listener: (context, state) {
                                  if (state is ReserveWorkshopLoading) {
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is ReserveWorkshopFailure) {
                                    showToast(AppColors.primary,
                                        msg: state.message);
                                  } else if (state is ReserveWorkshopSuccess) {
                                    showToast(AppColors.black,
                                        msg: "تم انشاء حجز جديد ");
                                    context.pushNamed(
                                      Routes.orderSummary,
                                      extra: state.reserve,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  final cubit =
                                      context.read<ReserveWorkshopCubit>();
                                  return DefaultButton(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    radius: 24,
                                    containerColor: AppColors.primary,
                                    title: 'حجز',
                                    onPressed: () {
                                      cubit.reserve();
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
