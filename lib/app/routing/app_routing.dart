
import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/presentation/view/layout/layout.dart';
import 'package:car_care/presentation/view/workshop/workshop_view.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.layout,
      builder: (context, state) => const LayoutPage(),
    ),
    GoRoute(
      path: '/workshop',
      name: Routes.workShop,
      builder: (context, state) => const WorkshopView(),
    ),
   
  ],
);
