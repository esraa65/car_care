import 'package:car_care/domain/repo/order_summary/order_summary_repo.dart';
import 'package:car_care/presentation/cubit/order_summary/order_summary_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final OrderSummaryRepo repo;
  OrderSummaryCubit(this.repo) : super(OrderSummaryInitialState());

  TextEditingController promocodeController = TextEditingController();

  Future<void> orderSummary() async {
    emit(OrderSummaryLoadingState());
    final response = await repo.orderSummary(
      carId: "35",
      promoCode: promocodeController.text,
      reservationDate: "2024-09-22",
      serviceIds: "2",
      type: "immediately",
      workshopId: "1",
    );

    response.fold((failure) {
      emit(OrderSummaryFailuireState(failure.message));
    }, (order) {
      emit(OrderSummarySuccessState(order));
    });
  }
}
