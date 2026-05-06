import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';

class AppButton extends StatelessWidget {
  final String text;

  const AppButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorPalette.deepViolet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(52),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppFontSizes.base,
              fontFamily: AppFontFamilies.kanit,
              fontWeight: FontWeight.w500,
              color: AppColorPalette.white,
            ),
          ),
        ),
      ),
    );
  }
}