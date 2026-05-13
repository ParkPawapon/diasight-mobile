import 'package:diasight_app/app/router/app_routes.dart';
import 'package:diasight_app/features/auth/presentation/routes/auth_routes.dart';
import 'package:diasight_app/features/onboarding/presentation/routes/onboarding_routes.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter({String initialLocation = AppRoutes.onboarding}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: AppRoutes.root,
        redirect: (context, state) => AppRoutes.onboarding,
      ),
      ...onboardingRoutes,
      ...authRoutes,
    ],
  );
}
