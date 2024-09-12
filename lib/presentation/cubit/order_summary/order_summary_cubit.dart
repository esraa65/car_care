import 'package:car_care/domain/repo/order_summary/order_summary_repo.dart';
import 'package:car_care/presentation/cubit/order_summary/order_summary_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final OrderSummaryRepo repo;
  OrderSummaryCubit(this.repo) : super(OrderSummaryInitialState());

  TextEditingController promocodeController = TextEditingController();

  String promoCode = '';
  double discountedPrice = 0;
  bool isPromoCodeApplied = false;

  Future<void> orderSummary() async {
    emit(OrderSummaryLoadingState());
    final response = await repo.orderSummary(
      promoCode: promocodeController.text,
      reservationDate: "2024-09-22",
      serviceIds: "2",
      type: "immediately",
      workshopId: "1",
      carId: '',
    );

    response.fold((failure) {
      emit(OrderSummaryFailuireState(failure.message));
    }, (order) {
      print("=================${order.totalPrice}");
      print("=================${order.hasPromoCode}");
      print("=================${order.originalPrice}");
      emit(OrderSummarySuccessState(order));
    });
  }

  //void applyPromoCode(double originalPrice, bool hasPromocode) {
  //   if (promoCode.isNotEmpty && hasPromocode) {
  //     double discount = calculateDiscount(promoCode, originalPrice);
  //     if (discount > 0) {
  //       discountedPrice = originalPrice - discount;
  //       isPromoCodeApplied = true;
  //       print("Discounted Price: $discountedPrice");
  //       emit(state);
  //     } else {}
  //   } else {
  //     print("You Don't Have Any PromoCodes Available");
  //   }
  // }

  // double calculateDiscount(String promoCode, double originalPrice) {
  //   if (promoCode == promocodeController.text) {
  //     return originalPrice * 0.1;
  //   }
  //   return 0;
  // }

  // void applyPromocode() {
  //   if (promocodeController.text == "Code12345") {}
  // }
}
