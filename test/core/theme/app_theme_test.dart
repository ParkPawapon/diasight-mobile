import 'package:diasight_app/core/theme/app_theme.dart';
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('maps semantic brand colors into Material themes', () {
      expect(AppTheme.light.colorScheme.primary, AppColors.brand);
      expect(AppTheme.dark.colorScheme.primary, AppColors.brandDark);
    });

    test('uses design system typography tokens', () {
      expect(
        AppTheme.light.textTheme.displayLarge?.fontFamily,
        AppFontFamilies.primary,
      );
      expect(
        AppTheme.light.textTheme.displayLarge?.fontSize,
        AppFontSizes.heading1,
      );
      expect(AppFontFamilies.primary, AppFontFamilies.kanit);
      expect(AppFontFamilies.secondary, AppFontFamilies.montserrat);
    });
  });
}
