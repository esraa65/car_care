import 'package:car_care/core/constants/end_point.dart';
import 'package:car_care/core/network/dio/base_dio.dart';
import 'package:car_care/core/network/dio/dio_client.dart';
import 'package:car_care/core/network/dio/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
      validateStatus: (status) {
        if (status == null) {
          return false;
        }
        if (status == 422) {
          // your http status code
          return true;
        } else {
          return status >= 200 && status < 300;
        }
      },
      baseUrl: EndPoint.baseUrl,
      followRedirects: false,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));

  getIt.registerSingleton<BaseDio>(DioClient(
      options: options, dio: Dio(), interceptors: [DioInterceptor()]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerDataSources() {}

void _registerRepos() {}

void _registerFactory() {}
