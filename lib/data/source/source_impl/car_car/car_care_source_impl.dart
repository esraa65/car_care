import 'package:car_care/core/constants/end_point.dart';
import 'package:car_care/core/network/dio/base_dio.dart';
import 'package:car_care/data/source/source_base/car_care/car_care_source.dart';
import 'package:dio/dio.dart';

class CarCareSourceImpl implements CarCareSource {
  final BaseDio dio;

  CarCareSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> service() async {
    try {
      final response = await dio.get(EndPoint.service,
          options: Options(
            headers: {
              'Authorization':
                  'NvyLc115VCztQPwazHTqL2rwXZ4jjl1CxcuxNJz7e0b95ebd'
            },
          ));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
