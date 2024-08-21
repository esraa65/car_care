import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routing/app_routing.dart';
import 'core/styles/app_style.dart';
import 'presentation/cubit/navigation_bar/cubit/navigation_bar_cubit.dart';

class CarCare extends StatelessWidget {
  const CarCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBarCubit>(
          create: (context) => NavigationBarCubit(),
        ),

        //  BlocProvider(create: (context) => LocalizationCubit()),
      ],
      child: MaterialApp.router(
        locale: const Locale('ar'),
        theme: AppStyle.themeData(),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
