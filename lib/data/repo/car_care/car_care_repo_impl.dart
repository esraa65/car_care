import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/data/source/source_base/car_care/car_care_source.dart';
import 'package:car_care/domain/entity/car_care_entity/service_entity.dart';
import 'package:car_care/domain/repo/car_car/car_car_repo.dart';
import 'package:dartz/dartz.dart';

class CarCareRepoImpl implements CarCareRepo {
  final CarCareSource careSource;

  CarCareRepoImpl(this.careSource);
  @override
  Future<Either<Failure, ServiceEntity>> service() async {
    try {
      final response = await careSource.service();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          ServiceEntity.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
