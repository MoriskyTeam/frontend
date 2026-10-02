import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Type scale: 12, 14, 16, 20, 28, 40.
///
/// Placeholder family (Inter) until the brand direction lands.
abstract final class RcbTypography {
  static TextTheme buildTextTheme({Color? color}) {
    final c = color ?? RcbColors.ink;
    final base = GoogleFonts.interTextTheme();

    return TextTheme(
      displayMedium: base.displayMedium?.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: c,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: c,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: c,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: c,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: c,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: c,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: c.withValues(alpha: 0.7),
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: c,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: c,
      ),
    );
  }
}
