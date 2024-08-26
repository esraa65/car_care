part of 'nearestworkshop_cubit.dart';

sealed class NearestWorkshopState extends Equatable {
  const NearestWorkshopState();

  @override
  List<Object> get props => [];
}

final class NearestWorkshopInitial extends NearestWorkshopState {}

final class NearestWorkshopLoading extends NearestWorkshopState {}

final class NearestWorkshopSuccess extends NearestWorkshopState {
  final List<WorkshopsEntity> workshops;
  const NearestWorkshopSuccess({required this.workshops});
  @override
  List<Object> get props => [workshops];
}

final class NearestWorkshopFailure extends NearestWorkshopState {
  final String message;
  const NearestWorkshopFailure({required this.message});
  @override
  List<Object> get props => [message];
}

final class WorkshopByIdSuccess extends NearestWorkshopSuccess {
  final WorkshopDetailsEntity workshopDetailsEntity;
  const WorkshopByIdSuccess(
      {required super.workshops, required this.workshopDetailsEntity});
  @override
  List<Object> get props => [workshopDetailsEntity];
}

final class WorkshopByIdFailure extends NearestWorkshopSuccess {
  final String message;
  const WorkshopByIdFailure({required super.workshops, required this.message});
  @override
  List<Object> get props => [message];
}

final class WorkshopByIdLoading extends NearestWorkshopSuccess {
  const WorkshopByIdLoading({required super.workshops});
  @override
  List<Object> get props => [];
}
