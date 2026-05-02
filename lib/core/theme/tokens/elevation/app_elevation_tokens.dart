import 'package:mix/mix.dart';

final class AppElevationTokens {
  const AppElevationTokens._();

  static const none = DoubleToken('elevation.none');
  static const sm = DoubleToken('elevation.sm');
  static const md = DoubleToken('elevation.md');
  static const lg = DoubleToken('elevation.lg');

  static final Map<DoubleToken, double> values = {
    none: 0.0,
    sm: 1.0,
    md: 3.0,
    lg: 8.0,
  };
}
