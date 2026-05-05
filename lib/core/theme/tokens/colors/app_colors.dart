import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:flutter/material.dart';

final class AppColors {
  const AppColors._();

  static const Color brand = AppColorPalette.deepViolet;
  static const Color brandHover = AppColorPalette.lavender;
  static const Color brandPressed = AppColorPalette.deepViolet;
  static const Color brandSoft = AppColorPalette.softLavender;
  static const Color brandForeground = AppColorPalette.white;

  static const Color accent = AppColorPalette.coral;
  static const Color accentSoft = AppColorPalette.salmon;
  static const Color accentDark = AppColorPalette.salmon;

  static const Color background = AppColorPalette.white;
  static const Color surface = AppColorPalette.white;
  static const Color surfaceMuted = AppColorPalette.gray50;
  static const Color border = AppColorPalette.gray200;

  static const Color textPrimary = AppColorPalette.black;
  static const Color textSecondary = AppColorPalette.gray600;
  static const Color textMuted = AppColorPalette.gray400;
  static const Color textInverse = AppColorPalette.white;

  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = AppColorPalette.salmon;
  static const Color info = AppColorPalette.deepViolet;

  static const Color brandDark = AppColorPalette.lavender;
  static const Color backgroundDark = AppColorPalette.gray900;
  static const Color surfaceDark = AppColorPalette.gray800;
  static const Color surfaceMutedDark = Color(0xFF3A3A3A);
  static const Color borderDark = Color(0xFF4A4A4A);
  static const Color textPrimaryDark = AppColorPalette.white;
  static const Color textSecondaryDark = AppColorPalette.gray200;
  static const Color textMutedDark = AppColorPalette.gray400;
  static const Color successDark = Color(0xFF4ADE80);
  static const Color warningDark = Color(0xFFFBBF24);
  static const Color dangerDark = AppColorPalette.coral;
  static const Color infoDark = AppColorPalette.softLavender;
}
