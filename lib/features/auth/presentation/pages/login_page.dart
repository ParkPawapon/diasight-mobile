import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:diasight_app/features/auth/presentation/widgets/login_form.dart';
import 'package:diasight_app/features/auth/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          LoginHeader(text: 'ยังไม่มีบัญชี?', account: 'สมัครสมาชิก'),
        ],
      ),
      body: Stack(
        children: [
          Container(color: Colors.deepPurple[900]),
          Positioned(
            top: -100,
            left: -90,
            child: _LoginBackgroundGlow(
              size: 280,
              color: AppColorPalette.softLavender.withValues(alpha: 0.3),
            ),
          ),
          Positioned(
            top: -70,
            right: -80,
            child: _LoginBackgroundGlow(
              size: 320,
              color: AppColorPalette.softLavender.withValues(alpha: 0.3),
            ),
          ),
          const Column(
            children: [
              SizedBox(height: 220),
              Expanded(child: LoginForm()),
            ],
          ),
          const SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFontFamilies.montserrat,
                      fontSize: AppFontSizes.heading1,
                      fontWeight: FontWeight.w800,
                      color: AppColorPalette.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginBackgroundGlow extends StatelessWidget {
  const _LoginBackgroundGlow({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}
