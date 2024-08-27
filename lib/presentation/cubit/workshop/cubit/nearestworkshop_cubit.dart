import 'package:bloc/bloc.dart';
import 'package:car_care/domain/entity/workshops/nearest_work_shop_entity.dart';
import 'package:car_care/domain/entity/workshops/workshop_details/workshop_details_entity.dart';
import 'package:car_care/domain/repo/workshop/nearest_workshop_repo.dart';
import 'package:equatable/equatable.dart';

part 'nearestworkshop_state.dart';

class NearestWorkshopCubit extends Cubit<NearestWorkshopState> {
  NearestWorkshopCubit({required this.nearestWorkshopRepo})
      : super(NearestWorkshopInitial());
  final NearestWorkshopRepo nearestWorkshopRepo;

  Future<void> getNearestWorkshop({
    required String latitude,
    required String longitude,
    required String carId,
    required String serviceId,
    required String type,
  }) async {
    emit(NearestWorkshopLoading());
    final response = await nearestWorkshopRepo.nearestWorkshops(
        latitude: latitude,
        longitude: longitude,
        carId: carId,
        serviceId: serviceId,
        type: type);
    response.fold(
      (failure) => emit(NearestWorkshopFailure(message: failure.message)),
      (nearestWorkshops) =>
          emit(NearestWorkshopSuccess(workshops: nearestWorkshops)),
    );
  }

  Future<void> getWorkshopById({required String id}) async {
    final List<WorkshopsEntity> workshops =
        (state as NearestWorkshopSuccess).workshops;
    emit(WorkshopByIdLoading(workshops: workshops));
    final response = await nearestWorkshopRepo.workshopById(id: id);
    response.fold(
      (failure) => emit(
          WorkshopByIdFailure(message: failure.message, workshops: workshops)),
      (workshopDetailsEntity) => emit(WorkshopByIdSuccess(
          workshops: workshops, workshopDetailsEntity: workshopDetailsEntity)),
    );
  }
}
