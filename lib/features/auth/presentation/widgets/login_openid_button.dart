import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class LoginOpenIdButton extends StatelessWidget {
  const LoginOpenIdButton({
    required this.text,
    required this.icon,
    this.onPressed,
    super.key,
  });

  final String text;
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColorPalette.softLavender,
            blurRadius: 15,
            spreadRadius: -12,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColorPalette.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(
            color: AppColorPalette.softLavender,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 30, height: 30, child: icon),
              const SizedBox(width: 12),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: AppFontSizes.base,
                  fontFamily: AppFontFamilies.kanit,
                  fontWeight: FontWeight.w800,
                  color: AppColorPalette.deepViolet,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
