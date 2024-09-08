import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/extensions/extensions.dart';
import 'package:car_care/core/extensions/media_query.dart';
import 'package:car_care/dependency_injection.dart';
import 'package:car_care/domain/entity/reserve_workshop/reserve_work_shop_entity.dart';
import 'package:car_care/presentation/cubit/order_summary/order_summary_cubit.dart';
import 'package:car_care/presentation/cubit/order_summary/order_summary_state.dart';
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widget/custom/custom_app_bar.dart';
import '../../widget/custom/default_button.dart';
import '../../widget/order_summary/custom_row_workshop_details_with_icon.dart';
import '../../widget/order_summary/custom_total_row.dart';
import '../../widget/order_summary/custom_work_shop_details.dart';
import '../../widget/order_summary/custom_workshop_image_row.dart';

class OrderSummary extends StatefulWidget {
  final ReserveWorkShopEntity entity;
  const OrderSummary({super.key, required this.entity});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderSummaryCubit(getIt()),
      child: BlocConsumer<OrderSummaryCubit, OrderSummaryState>(
        listener: (context, state) {
          if (state is OrderSummaryLoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrderSummarySuccessState) {
            Fluttertoast.showToast(
              msg: "======================================",
              backgroundColor: AppColors.primary,
              fontSize: 16,
              textColor: AppColors.white,
            );
          } else if (state is OrderSummaryFailuireState) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              backgroundColor: AppColors.primary,
              fontSize: 16,
              textColor: AppColors.white,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<OrderSummaryCubit>();
          return Scaffold(
              appBar: appBar(title: 'ملخص الطلب'),
              body: state is OrderSummaryLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              child: Column(
                                children: [
                                  CustomWorkshopImageRow(
                                    //! workShopImage:' order.workshop.logo',
                                    workshopName: widget.entity.workshop.name,
                                  ),
                                  height(32),
                                  CustomWorkShopDetails(
                                    subtitle: widget.entity.reservationDate
                                        .toString(),
                                    title: "تاريخ الحجز",
                                  ),
                                  height(16),
                                  const CustomWorkShopDetails(
                                    subtitle: "",
                                    title: "السياره",
                                  ),
                                  height(16),
                                  CustomWorkShopDetails(
                                    subtitle: widget.entity.services.first.name,
                                    title: "فئة الخدمة",
                                  ),
                                  height(16),
                                  const Divider(),
                                  height(16),
                                  SizedBox(
                                    height: widget.entity.services.length * 40 +
                                        (widget.entity.services.length - 1),
                                    width: double.infinity,
                                    child: ListView.separated(
                                      itemBuilder: (ctx, index) {
                                        return CustomRowWorkshopDetailsWithIcon(
                                            title: widget
                                                .entity.services[index].name,
                                            price:
                                                "${widget.entity.services[index].price} SAR",
                                            onTap: () {
                                              setState(() {
                                                widget.entity.services
                                                    .removeAt(index);
                                              });
                                            });
                                      },
                                      separatorBuilder: (ctx, index) =>
                                          height(16),
                                      itemCount: widget.entity.services.length,
                                    ),
                                  ),
                                  height(16),
                                  const Divider(),
                                  height(16),
                                  CustomTotalRow(
                                      price: "${widget.entity.totalPrice} SAR"),
                                ],
                              ),
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
                                          controller: cubit.promocodeController,
                                          onTap: () {},
                                          decoration: InputDecoration(
                                            hintText: "الرمز الترويجى",
                                            fillColor: Colors.grey[300],
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
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
                                      onPressed: () {
                                        cubit.orderSummary();
                                      },
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
        },
      ),
    );
  }
}
