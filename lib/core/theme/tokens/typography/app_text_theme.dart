import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

final class AppTextTheme {
  const AppTextTheme._();

  static const TextTheme material = TextTheme(
    displayLarge: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.heading1,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.heading2,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.heading3,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.heading4,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    titleLarge: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.title,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.body1,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.body2,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.description1,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFontFamilies.primary,
      fontSize: AppFontSizes.description2,
      fontWeight: FontWeight.w400,
      height: 1.35,
    ),
  );
}
