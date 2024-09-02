import 'package:car_care/domain/entity/order_summary/order_summary_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/error/failure.dart';

abstract class OrderSummaryRepo {
  Future<Either<Failure, OrderSummaryEntity>> orderSummary();
}
