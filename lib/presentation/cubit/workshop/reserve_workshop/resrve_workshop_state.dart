import 'package:car_care/domain/entity/reserve_workshop/reserve_work_shop_entity.dart';
import 'package:equatable/equatable.dart';

sealed class ResrveWorkshopState extends Equatable {
  const ResrveWorkshopState();

  @override
  List<Object> get props => [];
}

final class ReserveWorkshopInitial extends ResrveWorkshopState {}

final class ReserveWorkshopLoading extends ResrveWorkshopState {}

final class ReserveWorkshopSuccess extends ResrveWorkshopState {
  final ReserveWorkShopEntity reserve;
  const ReserveWorkshopSuccess({required this.reserve});
  @override
  List<Object> get props => [reserve];
}

final class ReserveWorkshopFailure extends ResrveWorkshopState {
  final String message;
  const ReserveWorkshopFailure({required this.message});
  @override
  List<Object> get props => [message];
}
