import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageStackWidget extends StatelessWidget {
    final String logo;

  const ImageStackWidget({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
      builder: (context, state) {
        if (state is WorkshopByIdLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WorkshopByIdSuccess) {
          final details = state.workshopDetailsEntity;
          return Stack(
            children: [
              Image.network(
                logo,
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 24,
                left: 10,
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child:
                            const Icon(Icons.share, color: AppColors.grey5D)),
                    const SizedBox(width: 8),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: const Icon(Icons.bookmark_border,
                            color: AppColors.grey5D)),
                  ],
                ),
              ),
              const Positioned(top: 24, right: 10, child: CustomArrowBack()),
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(4.0),
                    color: AppColors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:11,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Image.network(
                              details.logo ?? 'https://via.placeholder.com/150',
                              fit: BoxFit.fill,
                              width: MediaQuery.sizeOf(context).width *
                                  0.16, // Adjust width for images
                            ),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
