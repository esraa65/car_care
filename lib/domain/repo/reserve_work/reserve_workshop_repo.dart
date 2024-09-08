import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/domain/entity/reserve_workshop/reserve_work_shop_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ReserveWorkshopRepo {
  Future<Either<Failure, ReserveWorkShopEntity>> reserveWork({
    required String workshopid,
    required String serviceId,
    required String type,
    required String paymentType,
  });
}
