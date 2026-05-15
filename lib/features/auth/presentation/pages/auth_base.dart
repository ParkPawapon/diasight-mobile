import 'package:diasight_app/features/auth/presentation/widgets/form_base.dart';
import 'package:flutter/material.dart';
import '../widgets/Login/login_header.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../core/theme/tokens/typography/app_font_families.dart';

class AuthBased extends StatelessWidget {
  final Widget? customForm;
  final String? customTitle;
  final String? headerText;
  final String? headerAction;
  final VoidCallback? onPressed;
  final VoidCallback onBack;

  const AuthBased({
    super.key,
    this.customForm,
    this.customTitle,
    this.headerText,
    this.headerAction,
    this.onPressed,
    required this.onBack
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left, // หรือ Icons.arrow_back_ios_new
              color: AppColorPalette.white,
              size: 40,
            ),
            onPressed: onBack,
          ),
        ),

        actions: [
          HeaderLogin(
            text: headerText ?? '',
            account: headerAction ?? '',
            onPressed: onPressed,
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
              AppColorPalette.softLavender.withOpacity(0.4),
            ),
          ),

          Positioned(
            top: -70,
            right: -80,
            child: _buildGlow(
              320,
              AppColorPalette.softLavender.withOpacity(0.4),
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Text(
                    customTitle ?? 'Login',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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

          Column(
            children: [
              const SizedBox(height: 220),

              Expanded(
                child: customForm ?? const ModalFormBackground(),
              ),
            ],
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
