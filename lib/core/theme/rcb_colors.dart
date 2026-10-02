import 'package:flutter/material.dart';

/// Dynamic RCB Alerts palette.
///
/// Placeholder values until the brand direction lands. Hex values here are
/// the canonical source; do not eyeball variants in feature code. If you
/// need a tint/shade not listed here, add it here first.
abstract final class RcbColors {
  // Primary
  static const primary = Color(0xFF1F5EFF);
  static const secondary = Color(0xFF00B894);

  // Functional
  static const alert = Color(0xFFE5484D);
  static const warning = Color(0xFFF5A524);
  static const success = Color(0xFF30A46C);

  // Neutrals
  static const ink = Color(0xFF1C2024);
  static const paper = Color(0xFFFCFCFD);
  static const surfaceMuted = Color(0xFFF0F2F5);

  // Dark mode anchors
  static const night = Color(0xFF111418);
  static const nightMuted = Color(0xFF1D2127);
}
