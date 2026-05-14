import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';

class HeaderLogin extends StatelessWidget {
  final String text;
  final String account;
  const HeaderLogin({super.key, required this.text, required this.account});

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

          const SizedBox(
            width: 8,
          ),

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

