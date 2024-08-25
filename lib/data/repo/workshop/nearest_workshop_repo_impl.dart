import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/data/source/source_base/workshops/nearest_workshop_source.dart';
import 'package:car_care/domain/entity/workshops/nearest_work_shop_entity.dart';
import 'package:car_care/domain/repo/workshop/nearest_workshop_repo.dart';
import 'package:dartz/dartz.dart';

class NearestWorkshopRepoImpl implements NearestWorkshopRepo {
  final NearestWorkshopSource nearestWorkshopSource;
  NearestWorkshopRepoImpl({required this.nearestWorkshopSource});
  @override
  Future<Either<Failure, List<WorkshopsEntity>>> nearestWorkshops({
    required String latitude,
    required String longitude,
    required String carId,
    required String serviceId,
    required String type,
  }) async {
    try {
      final response = await nearestWorkshopSource.nearestWorkshops(
          latitude: latitude,
          longitude: longitude,
          carId: carId,
          serviceId: serviceId,
          type: type);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      final List<WorkshopsEntity> workshops = (response['data'] as List)
          .map((json) => WorkshopsEntity.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(workshops);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
