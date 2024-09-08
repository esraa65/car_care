import 'package:car_care/core/constants/end_point.dart';
import 'package:car_care/core/network/dio/base_dio.dart';
import 'package:car_care/data/source/source_base/reserve_work_shop/reserve_workshop_source.dart';
import 'package:dio/dio.dart';

class ReserveWorkshopSourceImpl implements ReserveWorkshopSource {
  final BaseDio dio;

  ReserveWorkshopSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> reserveWorkshop(
      {required String workshopid,
      required String serviceId,
      required String type,
      required String paymentType}) async {
    FormData data = FormData.fromMap({
      "work_shop_id": workshopid,
      "type": type,
      "service_ids[]": serviceId,
      "payment_type": paymentType,
    });
    try {
      final response = await dio.post(
        EndPoint.reserve,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
