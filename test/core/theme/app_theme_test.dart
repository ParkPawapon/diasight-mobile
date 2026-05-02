import 'package:diasight_app/core/theme/app_theme.dart';
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('maps semantic brand colors into Material themes', () {
      expect(AppTheme.light.colorScheme.primary, AppColors.brand);
      expect(AppTheme.dark.colorScheme.primary, AppColors.brandDark);
    });
  });
}
