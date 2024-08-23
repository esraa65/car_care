import 'package:equatable/equatable.dart';

import '../../../domain/entity/car_care_entity/service_entity.dart';

sealed class CarCareState extends Equatable {
  const CarCareState();
  @override
  List<Object?> get props => [];
}

class CarCareinitialState extends CarCareState {}

class ChangeContainerIndex extends CarCareState {}

class ChangeCheckBoxState extends CarCareState {}

final class CarCareLoadingState extends CarCareState {}

final class CarCareSuccessState extends CarCareState {
  final ServiceEntity serviceEntity;
  const CarCareSuccessState({required this.serviceEntity});

  @override
  List<Object?> get props => [serviceEntity];
}

final class CarCareFailureState extends CarCareState {
  final String message;

  const CarCareFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
