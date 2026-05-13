import 'package:diasight_app/app/router/app_routes.dart';
import 'package:diasight_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> onboardingRoutes = [
  GoRoute(
    path: AppRoutes.onboarding,
    name: AppRouteNames.onboarding,
    builder: (context, state) => const OnboardingPage(),
  ),
];
