import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final class AppRadiusTokens {
  const AppRadiusTokens._();

  static const none = RadiusToken('radius.none');
  static const sm = RadiusToken('radius.sm');
  static const md = RadiusToken('radius.md');
  static const lg = RadiusToken('radius.lg');
  static const full = RadiusToken('radius.full');

  static final Map<RadiusToken, Radius> values = {
    none: Radius.zero,
    sm: const Radius.circular(4),
    md: const Radius.circular(8),
    lg: const Radius.circular(12),
    full: const Radius.circular(999),
  };
}
