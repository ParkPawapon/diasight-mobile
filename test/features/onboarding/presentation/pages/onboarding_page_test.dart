import 'package:diasight_app/app/router/app_router.dart';
import 'package:diasight_app/core/theme/app_theme.dart';
import 'package:diasight_app/features/auth/presentation/pages/login_page.dart';
import 'package:diasight_app/features/onboarding/presentation/widgets/onboarding_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_fonts.dart';

void main() {
  setUpAll(loadAppFonts);

  testWidgets('routes from onboarding to login', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp.router(
        theme: AppTheme.light,
        routerConfig: createAppRouter(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ยินดีต้อนรับ'), findsOneWidget);

    await tester.tap(find.byType(OnboardingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
