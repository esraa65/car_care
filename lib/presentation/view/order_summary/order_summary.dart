import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/extensions/extensions.dart';
import 'package:car_care/core/extensions/media_query.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widget/custom/custom_app_bar.dart';
import '../../widget/custom/default_button.dart';
import '../../widget/order_summary/custom_row_workshop_details_with_icon.dart';
import '../../widget/order_summary/custom_total_row.dart';
import '../../widget/order_summary/custom_work_shop_details.dart';
import '../../widget/order_summary/custom_workshop_image_row.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'ملخص الطلب'),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    const CustomWorkshopImageRow(),
                    height(32),
                    const CustomWorkShopDetails(
                      subtitle: "02 يناير 2025 - 50 :09 م",
                      title: "تاريخ الحجز",
                    ),
                    height(16),
                    const CustomWorkShopDetails(
                      subtitle: "02 يناير 2025 - 50 :09 م",
                      title: "تاريخ الحجز",
                    ),
                    height(16),
                    const CustomWorkShopDetails(
                      subtitle: "02 يناير 2025 - 50 :09 م",
                      title: "تاريخ الحجز",
                    ),
                    height(16),
                    const Divider(),
                    height(16),
                    const CustomRowWorkshopDetailsWithIcon(
                      title: "تاريخ الحجز",
                      price: "SAR 50.00",
                    ),
                    height(16),
                    const CustomRowWorkshopDetailsWithIcon(
                      title: "تاريخ الحجز",
                      price: "SAR 50.00",
                    ),
                    height(16),
                    const Divider(),
                    height(16),
                    const CustomTotalRow(price: "SAR 50.00"),
                  ],
                ),
              ),
            ),
            WhiteContainer(
              height: context.h * 0.25,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const DefaultText(
                    text: "هل لديك رمز ترويجى؟ ",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey41,
                  ),
                  height(16),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Builder(builder: (context) {
                            return TextFormField(
                              canRequestFocus: false,
                              onTap: () {},
                              decoration: InputDecoration(
                                hintText: "الرمز  الترويجى",
                                fillColor: Colors.grey[300],
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            );
                          }),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: const DefaultText(
                            text: "تفعيل",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ).onTap(() {}),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Flexible(
                        child: DefaultButton(
                          width: double.maxFinite,
                          title: "الدفع",
                          onPressed: () {},
                        ),
                      ),
                      width(50),
                      Flexible(
                        child: DefaultButton(
                          width: double.maxFinite,
                          title: "اضافة خدمة",
                          onPressed: () {},
                          textColor: AppColors.black,
                          containerColor: AppColors.greyEB,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
