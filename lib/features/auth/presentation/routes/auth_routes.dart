import 'package:diasight_app/app/router/app_routes.dart';
import 'package:diasight_app/features/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> authRoutes = [
  GoRoute(
    path: AppRoutes.login,
    name: AppRouteNames.login,
    builder: (context, state) => const LoginPage(),
  ),
];
