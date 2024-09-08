import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/data/source/source_base/reserve_work_shop/reserve_workshop_source.dart';
import 'package:car_care/domain/entity/reserve_workshop/reserve_work_shop_entity.dart';
import 'package:car_care/domain/repo/reserve_work/reserve_workshop_repo.dart';
import 'package:dartz/dartz.dart';

class ReserveWorkshopRepoImpl implements ReserveWorkshopRepo {
  final ReserveWorkshopSource source;

  ReserveWorkshopRepoImpl(this.source);
  @override
  Future<Either<Failure, ReserveWorkShopEntity>> reserveWork(
      {required String workshopid,
      required String serviceId,
      required String type,
      required String paymentType}) async {
    try {
      final response = await source.reserveWorkshop(
        paymentType: paymentType,
        serviceId: serviceId,
        type: type,
        workshopid: workshopid,
      );
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        ReserveWorkShopEntity.fromJson(response['data']),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
