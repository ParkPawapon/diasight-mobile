import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';

class HeaderLogin extends StatelessWidget {
  final String text;
  final String account;
  final VoidCallback? onPressed;
  const HeaderLogin({
    super.key, 
    required this.text, 
    required this.account,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColorPalette.white,
                  fontSize: AppFontSizes.base,
                  fontFamily: AppFontFamilies.kanit
                ),
              ),

              const SizedBox(
                width: 8,
              ),

              GestureDetector(
                onTap: onPressed,
                child: Text(
                  account,
                  style: const TextStyle(
                    fontSize: AppFontSizes.base,
                    color: AppColorPalette.salmon,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFontFamilies.kanit
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
