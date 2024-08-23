import 'package:car_care/domain/repo/car_car/car_car_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'car_care_state.dart';

class CarCareCubit extends Cubit<CarCareState> {
  final CarCareRepo careRepo;
  CarCareCubit(this.careRepo) : super(CarCareinitialState());

  int selectedIndex = 0;

  bool isChecked = false;

  void changeConatinerIndex(int index) {
    selectedIndex = index;
    emit(ChangeContainerIndex());
  }

  void changeCheckBoxValue(bool val) {
    isChecked = !isChecked;
    emit(ChangeCheckBoxState());
  }

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
