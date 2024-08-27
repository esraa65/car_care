import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/presentation/view/Car_Care/Map_Screen/map_screen.dart';
import 'package:car_care/presentation/view/Car_Care/car_care_screen.dart';
import 'package:car_care/presentation/view/layout/layout.dart';
import 'package:car_care/presentation/view/workshop/workshop_view.dart';
import 'package:car_care/presentation/view/workshop_details/workshop_details_view.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/view/Filteration/filtreation_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CarCareScreen(),
    ),
    GoRoute(
      path: '/layout',
      name: Routes.layout,
      builder: (context, state) => const LayoutPage(),
    ),
    GoRoute(
      path: '/workshop',
      name: Routes.workShop,
      builder: (context, state) => const WorkshopView(),
    ),
    GoRoute(
      path: '/workshopDetailsView',
      name: Routes.workshopDetailsView,
      builder: (context, state) => const WorkshopDetailsView(),
    ),
    GoRoute(
      path: Routes.mapScreen,
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: Routes.filteration,
      builder: (context, state) => const FilterScreen(),
    ),
  ],
);
