import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/domain/entity/workshops/nearest_work_shop_entity.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/location_row_widget.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:car_care/presentation/widget/workshop/search_and_filter_icon.dart';
import 'package:car_care/presentation/widget/workshop/switch_widget.dart';
import 'package:car_care/presentation/widget/workshop/workshop_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopView extends StatefulWidget {
  const WorkshopView({super.key});

  @override
  State<WorkshopView> createState() => _WorkshopViewState();
}

class _WorkshopViewState extends State<WorkshopView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          height(30),
          const CustomArrowBack(),
          height(16),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16),
            child: DefaultText(
              text: "الموقع",
              color: AppColors.teal08,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: LocationRowWidget(),
          ),
          height(16),
          SearchAndFilterIcon(
            onSearchChanged: _onSearchChanged, // Directly call _onSearchChanged
            searchController: _searchController,
          ),
          height(16),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: SwitchWidget(
              initialValue: true,
              onChanged: (value) {},
            ),
          ),
          height(16),
          const Padding(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: DefaultText(
              text: 'مقدمي الخدمات',
              fontSize: 16,
              color: AppColors.grey4B,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
            builder: (context, state) {
              if (state is NearestWorkshopLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is NearestWorkshopSuccess) {
                final filteredWorkshops = _getFilteredWorkshops(state.workshops);
                return WorkshopListView(workshops: filteredWorkshops);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          height(16),
          WhiteContainer(
            widget: DefaultButton(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.06,
              containerColor: AppColors.primary,
              title: 'اقترح علي مركز صيانة',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged() {
    setState(() {}); // Rebuild UI directly when the search input changes
  }

  List<WorkshopsEntity> _getFilteredWorkshops(List<WorkshopsEntity> workshops) {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      return workshops;
    }
    return workshops
        .where((workshop) => workshop.name!.toLowerCase().contains(query))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
