import 'package:diasight_app/core/theme/tokens/colors/app_color_tokens.dart';
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:diasight_app/core/theme/tokens/elevation/app_elevation_tokens.dart';
import 'package:diasight_app/core/theme/tokens/radius/app_radius_tokens.dart';
import 'package:diasight_app/core/theme/tokens/spacing/app_space_tokens.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_text_tokens.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final class AppMixTokens {
  const AppMixTokens._();

  static Map<ColorToken, Color> get colors => {
    AppColorTokens.brand: AppColors.brand,
    AppColorTokens.brandHover: AppColors.brandHover,
    AppColorTokens.brandPressed: AppColors.brandPressed,
    AppColorTokens.brandSoft: AppColors.brandSoft,
    AppColorTokens.brandForeground: AppColors.brandForeground,
    AppColorTokens.accent: AppColors.accent,
    AppColorTokens.accentSoft: AppColors.accentSoft,
    AppColorTokens.background: AppColors.background,
    AppColorTokens.surface: AppColors.surface,
    AppColorTokens.surfaceMuted: AppColors.surfaceMuted,
    AppColorTokens.border: AppColors.border,
    AppColorTokens.textPrimary: AppColors.textPrimary,
    AppColorTokens.textSecondary: AppColors.textSecondary,
    AppColorTokens.textMuted: AppColors.textMuted,
    AppColorTokens.success: AppColors.success,
    AppColorTokens.warning: AppColors.warning,
    AppColorTokens.danger: AppColors.danger,
    AppColorTokens.info: AppColors.info,
  };

  static Map<SpaceToken, double> get spaces => AppSpaceTokens.values;

  static Map<RadiusToken, Radius> get radii => AppRadiusTokens.values;

  static Map<DoubleToken, double> get doubles => AppElevationTokens.values;

  static Map<TextStyleToken, TextStyle> get textStyles => AppTextTokens.values;
}
