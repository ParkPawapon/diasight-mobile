import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final class AppTextTokens {
  const AppTextTokens._();

  static const display = TextStyleToken('text.display');
  static const headline = TextStyleToken('text.headline');
  static const title = TextStyleToken('text.title');
  static const body = TextStyleToken('text.body');
  static const bodySmall = TextStyleToken('text.body.small');
  static const label = TextStyleToken('text.label');

  static final Map<TextStyleToken, TextStyle> values = {
    display: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.15,
    ),
    headline: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    title: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    body: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    label: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
  };
}
