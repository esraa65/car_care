import 'package:car_care/core/network/dio/base_dio.dart';

import '../source_base/exm_source.dart';

class ExmSourceImpl  implements ExmSource{
  final BaseDio baseDio;

  ExmSourceImpl({required this.baseDio});

  @override
  Future<Map<String, dynamic>> example() {
    // TODO: implement example
    throw UnimplementedError();
  }
  
}