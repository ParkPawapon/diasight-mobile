import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({required this.text, required this.account, super.key});

  final String text;
  final String account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColorPalette.white,
              fontSize: AppFontSizes.base,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            account,
            style: const TextStyle(
              color: AppColorPalette.salmon,
              fontSize: AppFontSizes.base,
            ),
          ),
        ],
      ),
    );
  }
}
