import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/presentation/view/workshop/workshop_on_map_view.dart';
import 'package:car_care/presentation/view/workshop/workshop_view.dart';
import 'package:car_care/presentation/view/workshop_details/workshop_details_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const CarCareScreen(),
    // ),
    // GoRoute(
    //   path: '/',
    //   name: Routes.layout,
    //   builder: (context, state) => const LayoutPage(),
    // ),
    GoRoute(
      path: '/',
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
    // GoRoute(
    //   path: Routes.mapScreen,
    //   builder: (context, state) => const MapScreen(),
    // ),
  ],
);
