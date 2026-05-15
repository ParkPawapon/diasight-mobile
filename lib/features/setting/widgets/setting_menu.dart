import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class Menubox extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onPressed;
  const Menubox({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColorPalette.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(
            color: AppColorPalette.softLavender,
            blurRadius: 10,
            spreadRadius: -2,
            offset: Offset(0, 1)
          )
        ]
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.start,
                text,
                style: const TextStyle(
                  fontFamily: AppFontFamilies.kanit,
                  fontSize: AppFontSizes.base,
                  fontWeight: FontWeight.w600,
                  color: AppColorPalette.deepViolet,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColorPalette.softLavender,
            ),
          ],
        ),
      ),
    );
  }
}
