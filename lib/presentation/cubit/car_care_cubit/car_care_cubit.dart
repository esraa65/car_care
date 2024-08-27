import 'package:car_care/domain/entity/car_care_entity/service_entity.dart';
import 'package:car_care/domain/repo/car_car/car_car_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_care_state.dart';

class CarCareCubit extends Cubit<CarCareState> {
  final CarCareRepo careRepo;
  CarCareCubit(this.careRepo) : super(CarCareinitialState());

  bool isChecked = false;

  List<ServiceEntity> getservice = [];

  Future<void> service() async {
    emit(CarCareLoadingState());

    final result = await careRepo.service();
    result.fold(
      (failure) {
        emit(CarCareFailureState(failure.message));
      },
      (service) {
        emit(CarCareSuccessState(serviceEntity: service));
      },
    );
  }
}
