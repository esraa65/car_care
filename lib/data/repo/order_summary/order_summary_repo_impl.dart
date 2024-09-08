import 'package:car_care/core/network/error/failure.dart';
import 'package:car_care/data/source/source_base/order_summary/order_summary_source.dart';

import 'package:car_care/domain/entity/order_summary/order_summary_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repo/order_summary/order_summary_repo.dart';

class OrderSummaryRepoImpl implements OrderSummaryRepo {
  final OrderSummarySource source;

  OrderSummaryRepoImpl(this.source);
  @override
  Future<Either<Failure, OrderSummaryEntity>> orderSummary({
    required String workshopId,
    required String reservationDate,
    required String type,
    required String serviceIds,
    String? promoCode,
    String? carId,
  }) async {
    try {
      final response = await source.orderSummary(
        reservationDate: reservationDate,
        serviceIds: serviceIds,
        type: type,
        workshopId: workshopId,
        carId: carId!,
        promoCode: promoCode!,
      );
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        OrderSummaryEntity.fromJson(response['data']),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
