import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/onboarding_slide_card.dart';
import '../widgets/onboarding_action_bar.dart'; // สมมติว่า AppButton อยู่ในนี้
import '../../../../features/auth/presentation/pages/login_page.dart';

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
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
            ),
            const SizedBox(height: 40),
            
            // ใช้ปุ่มที่คุณสร้างไว้ (ตรวจสอบชื่อคลาสปุ่มให้ตรง เช่น AppButton หรือ LoginButton)
            AppButton(
              text: 'เข้าสู่ระบบ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                    settings: const RouteSettings(name: '/loginPage')
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}