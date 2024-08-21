
import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/presentation/view/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.layout,
      builder: (context, state) => const LayoutPage(),
    ),
   
  ],
);
