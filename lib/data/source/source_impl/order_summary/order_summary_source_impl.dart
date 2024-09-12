import 'package:dio/dio.dart';
import '../../../../core/constants/end_point.dart';
import '../../../../core/network/dio/base_dio.dart';
import '../../source_base/order_summary/order_summary_source.dart';

class OrderSummarySourceImpl implements OrderSummarySource {
  final BaseDio dio;

  OrderSummarySourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> orderSummary({
    required String workshopId,
    required String reservationDate,
    required String type,
    required String serviceIds,
    String? promoCode,
    String? carId,
  }) async {
    FormData data = FormData.fromMap({
      "work_shop_id": workshopId,
      "reservation_date": reservationDate,
      "car_id": carId,
      "type": type,
      "service_ids[]": serviceIds,
      "promocode": promoCode,
    });

    try {
      final response = await dio.post(
        EndPoint.checkout,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
