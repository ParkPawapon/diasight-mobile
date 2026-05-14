import 'package:flutter/material.dart';
import '../../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../../core/theme/tokens/typography/app_font_families.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorPalette.deepViolet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppFontSizes.base,
              fontFamily: AppFontFamilies.kanit,
              fontWeight: FontWeight.w600,
              color: AppColorPalette.white,
            ),
          ),
        ),
      ),
    );
  }
}
