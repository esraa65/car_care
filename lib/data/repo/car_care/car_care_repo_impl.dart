import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/data/source/source_base/car_care/car_care_source.dart';
import 'package:car_care/domain/entity/car_care_entity/service_entity.dart';
import 'package:car_care/domain/repo/car_car/car_car_repo.dart';
import 'package:dartz/dartz.dart';

class CarCareRepoImpl implements CarCareRepo {
  final CarCareSource careSource;

  CarCareRepoImpl(this.careSource);
  @override
  Future<Either<Failure, List<ServiceEntity>>> service() async {
    try {
      final response = await careSource.service();
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<ServiceEntity> services = dataList
          .map((json) => ServiceEntity.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(services);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
