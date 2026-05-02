import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

final class AppColors {
  const AppColors._();

  static final Color brand = TW3Colors.blue.shade600;
  static final Color brandHover = TW3Colors.blue.shade700;
  static final Color brandPressed = TW3Colors.blue.shade800;
  static const Color brandForeground = Colors.white;

  static final Color accent = TW3Colors.cyan.shade600;
  static final Color accentDark = TW3Colors.cyan.shade400;

  static final Color background = TW3Colors.slate.shade50 ?? Colors.white;
  static final Color surface = TW3Colors.slate.shade50 ?? Colors.white;
  static final Color surfaceMuted = TW3Colors.slate.shade100;
  static final Color border = TW3Colors.slate.shade200;

  static final Color textPrimary = TW3Colors.slate.shade900;
  static final Color textSecondary = TW3Colors.slate.shade700;
  static final Color textMuted = TW3Colors.slate.shade500;
  static const Color textInverse = Colors.white;

  static final Color success = TW3Colors.emerald.shade600;
  static final Color warning = TW3Colors.amber.shade500;
  static final Color danger = TW3Colors.rose.shade600;
  static final Color info = TW3Colors.sky.shade600;

  static final Color brandDark = TW3Colors.blue.shade400;
  static final Color backgroundDark = TW3Colors.slate.shade900;
  static final Color surfaceDark = TW3Colors.slate.shade900;
  static final Color surfaceMutedDark = TW3Colors.slate.shade800;
  static final Color borderDark = TW3Colors.slate.shade700;
  static final Color textPrimaryDark = TW3Colors.slate.shade50 ?? Colors.white;
  static final Color textSecondaryDark = TW3Colors.slate.shade300;
  static final Color textMutedDark = TW3Colors.slate.shade400;
  static final Color successDark = TW3Colors.emerald.shade400;
  static final Color warningDark = TW3Colors.amber.shade400;
  static final Color dangerDark = TW3Colors.rose.shade400;
  static final Color infoDark = TW3Colors.sky.shade400;
}
