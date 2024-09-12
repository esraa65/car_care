import 'package:bloc/bloc.dart';

import '../../../../domain/repo/reserve_work/reserve_workshop_repo.dart';
import 'resrve_workshop_state.dart';

class ReserveWorkshopCubit extends Cubit<ResrveWorkshopState> {
  final ReserveWorkshopRepo repo;
  ReserveWorkshopCubit(this.repo) : super(ReserveWorkshopInitial());

  Future<void> reserve() async {
    emit(ReserveWorkshopLoading());

    final response = await repo.reserveWork(
      workshopid: "1",
      serviceId: "2",
      type: "immediately",
      paymentType: "cash",
    );

    response.fold(
      (failure) => emit(ReserveWorkshopFailure(message: failure.message)),
      (nearestWorkshops) =>
          emit(ReserveWorkshopSuccess(reserve: nearestWorkshops)),
    );
  }
}
