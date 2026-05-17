import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  final String text;
  final VoidCallback onBack;
  const SettingHeader({super.key, required this.text, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onBack,
            icon: const Icon(
              Icons.chevron_left,
              color: AppColors.brand,
              size: 40,
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          Text(
            text,
            style: const TextStyle(
              fontFamily: AppFontFamilies.kanit,
              fontSize: AppFontSizes.heading4,
              fontWeight: FontWeight.w700,
              color: AppColors.brand,
            ),
          ),
        ],
      ),
    );
  }
}
