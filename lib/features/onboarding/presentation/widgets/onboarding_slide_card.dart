import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';


class OnboardingSlideCard extends StatelessWidget {
  final String title;
  final String description;

  //constructor
  const OnboardingSlideCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppFontSizes.heading3,
              fontFamily: AppFontFamilies.kanit,
              fontWeight: FontWeight.w500,
              color: AppColorPalette.deepViolet,
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              height: 1.5,
              fontSize: AppFontSizes.description1,
              fontFamily: AppFontFamilies.kanit,
              fontWeight: FontWeight.w300,
              color: AppColorPalette.deepViolet,
            ),
          ),
        ],
      ),
    );
  }
}
