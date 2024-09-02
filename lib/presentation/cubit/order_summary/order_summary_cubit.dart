import 'package:car_care/domain/repo/order_summary/order_summary_repo.dart';
import 'package:car_care/presentation/cubit/order_summary/order_summary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final OrderSummaryRepo repo;
  OrderSummaryCubit(this.repo) : super(OrderSummaryInitialState());

  Future<void> orderSummary() async {
    emit(OrderSummaryLoadingState());
    final response = await repo.orderSummary();

    response.fold((failure) {
      emit(OrderSummaryFailuireState(failure.message));
    }, (order) {
      emit(OrderSummarySuccessState(order));
    });
  }
}
