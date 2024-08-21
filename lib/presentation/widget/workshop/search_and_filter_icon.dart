import 'package:car_care/core/constants/app_assets.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/widget/custom/text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndFilterIcon extends StatelessWidget {
  const SearchAndFilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.greyF2,
                      spreadRadius: 6,
                      blurRadius: 9,
                      offset: const Offset(0, 9), // changes position of shadow
                    ),
                  ]),
              child: SvgPicture.asset(AppAssets.filter)),
          SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.75,
              child: TextFormFieldCustom(
                controller: TextEditingController(),
                hintText: 'بحث',
                borderColor: AppColors.white,
                suffixIcon: Icon(Icons.search),
              )),
        ],
      ),
    );
  }
}
