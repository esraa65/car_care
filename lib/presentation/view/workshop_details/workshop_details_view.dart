import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/view/workshop_details/about_view.dart';
import 'package:car_care/presentation/view/workshop_details/gallary_view.dart';
import 'package:car_care/presentation/view/workshop_details/rating_view.dart';
import 'package:car_care/presentation/view/workshop_details/services_view.dart';
import 'package:car_care/presentation/widget/workshop_details/image_stack_widget.dart';
import 'package:car_care/presentation/widget/workshop_details/workshop_row_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopDetailsView extends StatefulWidget {
  final String id;
  const WorkshopDetailsView({super.key, required this.id});

  @override
  State<WorkshopDetailsView> createState() => _WorkshopDetailsViewState();
}

class _WorkshopDetailsViewState extends State<WorkshopDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NearestWorkshopCubit>(context)
        .getWorkshopById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
              builder: (context, state) {
            if (state is WorkshopByIdLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WorkshopByIdSuccess) {
              final details = state.workshopDetailsEntity;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageStackWidget(
                    logo: details.logo ?? "https://via.placeholder.com/200x200",
                  ),
                  WorkshopRowDataWidget(
                    rating: details.starRating.toString(),
                    reviewCount: details.starRating.toString(),
                    category: details.name.toString(),
                    workshopName: details.name.toString(),
                    location: details.address.toString(),
                  ),
                  const TabBar(
                    tabs: [
                      Tab(text: "عن الشركة"),
                      Tab(text: "الصور"),
                      Tab(text: "التقييمات"),
                      Tab(text: "الخدمات"),
                    ],
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.grey9c,
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        AboutView(
                          description: details.arDescription ?? "",
                        ),
                        GalleryWidget(
                          pics: [
                            details.logo ??
                                "https://via.placeholder.com/200x200",
                            details.logo ??
                                "https://via.placeholder.com/200x200",
                            details.logo ??
                                "https://via.placeholder.com/200x200",
                            details.logo ??
                                "https://via.placeholder.com/200x200",
                            details.logo ??
                                "https://via.placeholder.com/200x200",
                          ],
                        ),
                        const RatingView(
                          name: "عبدالرحمن محمد",
                          maintainType: "تعميم",
                          pic: "https://picsum.photos/200",
                          date: "12/12/2022",
                          review: "خدمة سريعة وجيدة",
                        ),
                        const ServicesView(),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
