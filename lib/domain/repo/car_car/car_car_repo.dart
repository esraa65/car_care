import 'package:car_care/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../entity/car_care_entity/service_entity.dart';

abstract class CarCareRepo {
  Future<Either<Failure, ServiceEntity>> service();
}
