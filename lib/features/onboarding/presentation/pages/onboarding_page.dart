import 'dart:async';

import 'package:diasight_app/app/router/app_routes.dart';
import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/features/onboarding/presentation/widgets/onboarding_action_bar.dart';
import 'package:diasight_app/features/onboarding/presentation/widgets/onboarding_illustration.dart';
import 'package:diasight_app/features/onboarding/presentation/widgets/onboarding_slide_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPalette.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OnboardingIllustration(),
            const SizedBox(height: 10),
            const OnboardingSlideCard(
              title: 'ยินดีต้อนรับ',
              description:
                  'Lorem Ipsum is simply dummy text of the printing and '
                  "typesetting industry. Lorem Ipsum has been the industry's "
                  'standard',
            ),
            const SizedBox(height: 40),
            OnboardingActionButton(
              text: 'เข้าสู่ระบบ',
              onPressed: () {
                unawaited(context.pushNamed(AppRouteNames.login));
              },
            ),
          ],
        ),
      ),
    );
  }
}
