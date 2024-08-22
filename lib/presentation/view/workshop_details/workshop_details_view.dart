import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/view/workshop_details/about_view.dart';
import 'package:car_care/presentation/view/workshop_details/gallary_view.dart';
import 'package:car_care/presentation/view/workshop_details/rating_view.dart';
import 'package:car_care/presentation/view/workshop_details/services_view.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/workshop_details/image_stack_widget.dart';
import 'package:car_care/presentation/widget/workshop_details/workshop_row_data_widget.dart';
import 'package:flutter/material.dart';

class WorkshopDetailsView extends StatelessWidget {
  const WorkshopDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageStackWidget(),
              const WorkshopRowDataWidget(),
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
                child: const TabBarView(
                  children: [
                    AboutView(),
                    GalleryWidget(),
                    RatingView(),
                    ServicesView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCheckbox extends StatelessWidget {
  final String title;
  final String price;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const ServiceCheckbox({
    super.key,
    required this.title,
    required this.price,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: DefaultText(text: title),
      subtitle: DefaultText(text: price),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.primary,
    );
  }
}
