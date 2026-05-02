import 'package:mix/mix.dart';

final class AppSpaceTokens {
  const AppSpaceTokens._();

  static const zero = SpaceToken('space.0');
  static const xxs = SpaceToken('space.1');
  static const xs = SpaceToken('space.2');
  static const sm = SpaceToken('space.3');
  static const md = SpaceToken('space.4');
  static const lg = SpaceToken('space.6');
  static const xl = SpaceToken('space.8');
  static const xxl = SpaceToken('space.10');
  static const section = SpaceToken('space.16');

  static final Map<SpaceToken, double> values = {
    zero: 0.0,
    xxs: 4.0,
    xs: 8.0,
    sm: 12.0,
    md: 16.0,
    lg: 24.0,
    xl: 32.0,
    xxl: 40.0,
    section: 64.0,
  };
}
