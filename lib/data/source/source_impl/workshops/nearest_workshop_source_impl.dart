import 'package:car_care/core/constants/end_point.dart';
import 'package:car_care/core/network/dio/base_dio.dart';
import 'package:dio/dio.dart';

import '../../source_base/workshops/nearest_workshop_source.dart';

class NearestWorkshopSourceImpl implements NearestWorkshopSource {
  final BaseDio baseDio;

  NearestWorkshopSourceImpl({required this.baseDio});
  @override
  Future<Map<String, dynamic>> nearestWorkshops({
    required String latitude,
    required String longitude,
    required String carId,
    required String serviceId,
    required String type,
  }) async {
    FormData formData = FormData.fromMap({
      "latitude": latitude,
      "longitude": longitude,
      "car_id": carId,
      "service_ids[]": serviceId,
      "type": type
    });
    try {
      final response = await baseDio.post(EndPoint.nearest, data: formData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> workshopById({required String id}) async {
    try {
      final response = await baseDio.get("${EndPoint.workshopById}$id");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
