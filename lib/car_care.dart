import 'package:car_care/dependency_injection.dart';
import 'package:car_care/presentation/cubit/map/map_cubit.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/routing/app_routing.dart';
import 'core/styles/app_style.dart';

class CarCare extends StatelessWidget {
  const CarCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapCubit>(
          create: (context) {
            final cubit = MapCubit();
            cubit.getCuruntLocation();
            return cubit;
          },
        ),
        BlocProvider<NearestWorkshopCubit>(
            create: (context) =>
                NearestWorkshopCubit(nearestWorkshopRepo: getIt())
                  ..getNearestWorkshop(
                    latitude: "30.104732",
                    longitude: "31.378030",
                    //carId: "35",
                    serviceId: "2",
                    type: "immediately",
                  )),
        BlocProvider(create: (context) => AppCubit())

        //  BlocProvider(create: (context) => LocalizationCubit()),
      ],
      child: MaterialApp.router(
        theme: AppStyle.themeData(),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
