import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/custom_search_bar.dart';
import 'package:flutter/material.dart';

class SearchAndFilterIcon extends StatelessWidget {
  final TextEditingController? searchController;
  final VoidCallback? onSearchChanged;

  const SearchAndFilterIcon({
    super.key,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.greyF2,
                  spreadRadius: 6,
                  blurRadius: 9,
                  offset: Offset(0, 9), // changes position of shadow
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_list_bulleted),
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.greyF2,
                    spreadRadius: 6,
                    blurRadius: 9,
                    offset: Offset(0, 9), // changes position of shadow
                  ),
                ],
              ),
              child: CustomSearchBar(
                searchController: searchController,
                borderColor: AppColors.white,
                borderRadius: 12,
                hintText: 'بحث',
                onSearchChanged: onSearchChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
