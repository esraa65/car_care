import 'package:car_care/core/constants/end_point.dart';
import 'package:car_care/core/network/dio/base_dio.dart';
import 'package:car_care/data/source/source_base/car_care/car_care_source.dart';

class CarCareSourceImpl implements CarCareSource {
  final BaseDio dio;

  CarCareSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> service() async {
    try {
      final response = await dio.get(
        EndPoint.service,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
