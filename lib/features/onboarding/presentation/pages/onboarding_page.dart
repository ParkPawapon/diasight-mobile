import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/onboarding_slide_card.dart';
import '../widgets/onboarding_action_bar.dart';
import '../../../../features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: AppColorPalette.white,
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OnboardingIllustration(),

                  const SizedBox(height: 10),

                  const OnboardingSlideCard(
                    title: 'ยินดีต้อนรับ',
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                  ),

                  const SizedBox(height: 40),

                  AppButton(
                    text: 'เข้าสู่ระบบ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
}
