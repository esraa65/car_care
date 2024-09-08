import 'package:car_care/core/constants/end_point.dart';
import 'package:car_care/core/network/dio/base_dio.dart';
import 'package:car_care/core/network/dio/dio_client.dart';
import 'package:car_care/core/network/dio/dio_interceptor.dart';
import 'package:car_care/data/repo/car_care/car_care_repo_impl.dart';
import 'package:car_care/data/repo/reserve_workshop/reserve_workshop_repo_impl.dart';
import 'package:car_care/data/repo/workshop/nearest_workshop_repo_impl.dart';
import 'package:car_care/data/source/source_base/car_care/car_care_source.dart';
import 'package:car_care/data/source/source_base/order_summary/order_summary_source.dart';
import 'package:car_care/data/source/source_base/reserve_work_shop/reserve_workshop_source.dart';
import 'package:car_care/data/source/source_base/workshops/nearest_workshop_source.dart';
import 'package:car_care/data/source/source_impl/car_car/car_care_source_impl.dart';
import 'package:car_care/data/source/source_impl/order_summary/order_summary_source_impl.dart';
import 'package:car_care/data/source/source_impl/reserve_workshop/reserve_workshop_source_impl.dart';
import 'package:car_care/data/source/source_impl/workshops/nearest_workshop_source_impl.dart';
import 'package:car_care/domain/repo/car_car/car_car_repo.dart';
import 'package:car_care/domain/repo/order_summary/order_summary_repo.dart';
import 'package:car_care/domain/repo/reserve_work/reserve_workshop_repo.dart';
import 'package:car_care/domain/repo/workshop/nearest_workshop_repo.dart';
import 'package:car_care/presentation/cubit/car_care_cubit/car_care_cubit.dart';
import 'package:car_care/presentation/cubit/order_summary/order_summary_cubit.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/cubit/workshop/reserve_workshop/reserve_workshop_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repo/order_summary/order_summary_repo_impl.dart';

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

void _registerDataSources() {
  getIt.registerSingleton<CarCareSource>(CarCareSourceImpl(getIt()));
  getIt.registerSingleton<NearestWorkshopSource>(
      NearestWorkshopSourceImpl(baseDio: getIt()));
  getIt.registerSingleton<OrderSummarySource>(OrderSummarySourceImpl(getIt()));
  getIt.registerSingleton<ReserveWorkshopSource>(
      ReserveWorkshopSourceImpl(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<CarCareRepo>(CarCareRepoImpl(getIt()));
  getIt.registerSingleton<NearestWorkshopRepo>(
      NearestWorkshopRepoImpl(nearestWorkshopSource: getIt()));
  getIt.registerSingleton<OrderSummaryRepo>(OrderSummaryRepoImpl(getIt()));
  getIt
      .registerSingleton<ReserveWorkshopRepo>(ReserveWorkshopRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<CarCareCubit>(() => CarCareCubit(getIt()));
  getIt.registerFactory<NearestWorkshopCubit>(
      () => NearestWorkshopCubit(nearestWorkshopRepo: getIt()));
  getIt.registerFactory<OrderSummaryCubit>(() => OrderSummaryCubit(getIt()));
  getIt.registerFactory<ReserveWorkshopCubit>(
      () => ReserveWorkshopCubit(getIt()));
}
