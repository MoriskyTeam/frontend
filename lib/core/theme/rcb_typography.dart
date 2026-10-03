import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Type scale: 12, 13, 14, 16, 20, 24, 32.
///
/// Barlow Condensed — the lettering of signs and vehicle livery — carries
/// titles, labels and every number. Barlow carries running text.
abstract final class RcbTypography {
  static TextTheme buildTextTheme({required Color color}) {
    final condensed = GoogleFonts.barlowCondensedTextTheme();
    final body = GoogleFonts.barlowTextTheme();

    return TextTheme(
      displaySmall: condensed.displaySmall?.copyWith(
        fontSize: 32,
        height: 1.05,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      headlineSmall: condensed.headlineSmall?.copyWith(
        fontSize: 24,
        height: 1.1,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      titleLarge: condensed.titleLarge?.copyWith(
        fontSize: 20,
        height: 1.15,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      titleMedium: condensed.titleMedium?.copyWith(
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: color,
      ),
      titleSmall: condensed.titleSmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: color,
      ),
      bodyLarge: body.bodyLarge?.copyWith(
        fontSize: 16,
        height: 1.45,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: body.bodyMedium?.copyWith(
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: body.bodySmall?.copyWith(
        fontSize: 13,
        height: 1.35,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      labelLarge: condensed.labelLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.4,
        color: color,
      ),
      labelMedium: condensed.labelMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
        color: color,
      ),
      labelSmall: condensed.labelSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        color: color,
      ),
    );
  }

  /// Tabular figures for distances, readings and counts.
  static const tabular = [FontFeature.tabularFigures()];
}
