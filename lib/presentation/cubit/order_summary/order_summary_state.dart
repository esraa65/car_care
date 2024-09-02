import 'package:car_care/domain/entity/order_summary/order_summary_entity.dart';
import 'package:equatable/equatable.dart';

sealed class OrderSummaryState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class OrderSummaryInitialState extends OrderSummaryState {}

final class OrderSummarySuccessState extends OrderSummaryState {
  final OrderSummaryEntity entity;

  OrderSummarySuccessState(this.entity);
  @override
  List<Object?> get props => [entity];
}

final class OrderSummaryFailuireState extends OrderSummaryState {
  final String errorMessage;

  OrderSummaryFailuireState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

final class OrderSummaryLoadingState extends OrderSummaryState {}
