import 'dart:developer';

// import 'package:car_care/core/constants/app_shared_prefrences_keys.dart';
// import 'package:car_care/dependency_injection.dart';
import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("=======================================");
    log("====================${err.toString()}");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const token = "49|usSCZYUW5k0LwA5r8B6qHnG0cia3UX3HlrQIbcoGea2143fd";
    options.headers["Authorization"] = "Bearer $token";
    log("=======================================");
    log("Request");
    log("url:=> ${options.path}");
    log("content:=> ${options.contentType}");
  //  log("headers:=> hasToken:${token != null}");
    log("body:=> ${options.data != null ? options.data! : "Data is null"}");
    log("=======================================");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("=======================================");
    log("Response:");
    log("url:=> ${response.requestOptions.path}");
    log("statusCode:=> ${response.statusCode}");
    log("body:=> hasData: ${response.data != null}");
    log("=======================================");

    // if (response.statusCode == 401 ||
    //     response.data.toLowerCase().contains("unauthorized")) {
    //   preferences.clear();
    //   navigatorKey.currentContext!.goNamed(Routes.login);
    // }
    handler.next(response);
  }
}
