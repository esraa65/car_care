import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/presentation/view/workshop/workshop_on_map_view.dart';
import 'package:car_care/presentation/view/Map_Screen/map_screen.dart';
import 'package:car_care/presentation/view/workshop/workshop_view.dart';
import 'package:car_care/presentation/view/workshop_details/workshop_details_view.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/view/Car_Care/car_care_screen.dart';
import '../../presentation/view/Filteration/filtreation_screen.dart';
import '../../presentation/view/order_summary/order_summary.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.initial,
      builder: (context, state) => const CarCareScreen(),
    ),
    GoRoute(
      path: '/${Routes.workShop}',
      name: Routes.workShop,
      builder: (context, state) => const WorkshopView(),
    ),
    GoRoute(
        path: '/${Routes.workshopDetailsView}/:id',
        name: Routes.workshopDetailsView,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return WorkshopDetailsView(id: id);
        }),
    GoRoute(
      path: '/${Routes.workshopOnMapView}',
      name: Routes.workshopOnMapView,
      builder: (context, state) => const WorkshopOnMapView(),
    ),
    GoRoute(
      path: Routes.mapScreen,
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: Routes.filteration,
      builder: (context, state) => const FilterScreen(),
    ),
    GoRoute(
      path: Routes.orderSummary,
      builder: (context, state) => const OrderSummary(),
    ),
  ],
);
