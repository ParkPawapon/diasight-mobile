import 'package:flutter/material.dart';

class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: Image.asset(
        'assets/images/onboardings/onboarding.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
