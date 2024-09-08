import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/domain/entity/workshops/nearest_work_shop_entity.dart';
import 'package:car_care/domain/entity/workshops/workshop_details/workshop_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NearestWorkshopRepo {
  Future<Either<Failure, List<WorkshopsEntity>>> nearestWorkshops({
    required String latitude,
    required String longitude,
    //  required String carId,
    required String serviceId,
    required String type,
  });

  Future<Either<Failure, WorkshopDetailsEntity>> workshopById(
      {required String id});
}
