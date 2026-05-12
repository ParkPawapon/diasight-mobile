import 'package:flutter/material.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../core/theme/tokens/typography/app_font_families.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          HeaderLogin(
            text: 'ยังไม่มีบัญชี?',
            account: 'สมัครสมาชิก',
          ),
        ],
      ),

      body: Stack(
        children: [
          Container(
            color: Colors.deepPurple[900],
          ),

          Positioned(
            top: -100,
            left: -90,
            child: _buildGlow(
              280,
              AppColorPalette.softLavender.withOpacity(0.3),
            ),
          ),

          Positioned(
            top: -70,
            right: -80,
            child: _buildGlow(
              320,
              AppColorPalette.softLavender.withOpacity(0.3),
            ),
          ),

          const Column(
            children: [
              SizedBox(height: 220),

              Expanded(
                child: ModalFormBackground(),
              ),
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

Widget _buildGlow(double size, Color color) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          color,
          color.withOpacity(0),
        ],
      ),
    ),
  );
}