import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.brand,
        ).copyWith(
          primary: AppColors.brand,
          onPrimary: AppColors.brandForeground,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          error: AppColors.danger,
          outline: AppColors.border,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData get dark {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.brandDark,
          onPrimary: AppColors.brandForeground,
          secondary: AppColors.accentDark,
          surface: AppColors.surfaceDark,
          error: AppColors.dangerDark,
          outline: AppColors.borderDark,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
