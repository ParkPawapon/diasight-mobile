import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/onboarding_slide_card.dart';
import '../widgets/onboarding_action_bar.dart';

void main() {
  runApp(
    const MaterialApp(
      // ต้องมี Scaffold เป็นรากฐานของหน้าจอเสมอ
      home: Scaffold(
        backgroundColor: AppColorPalette.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnboardingIllustration(),
              SizedBox(
                height: 10,
              ),
              OnboardingSlideCard(
                title: 'ยินดีต้อนรับ',
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
              ),
              SizedBox(
                height: 40,
              ),
              AppButton(text: 'เริ่มต้นใช้งาน'),
            ],
          ),
        ),
      ),
    ),
  );
}
