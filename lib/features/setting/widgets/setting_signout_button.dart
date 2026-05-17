import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  final VoidCallback onTap;
  const SignOutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 36),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'ออกจากระบบ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppFontSizes.base,
                fontFamily: AppFontFamilies.kanit,
                fontWeight: FontWeight.w600,
                color: AppColorPalette.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
