import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:flutter/material.dart';

/// Builds the app's light + dark ThemeData.
abstract final class RcbTheme {
  static ThemeData light() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: RcbColors.primary,
      onPrimary: Colors.white,
      secondary: RcbColors.secondary,
      onSecondary: Colors.white,
      error: RcbColors.alert,
      onError: Colors.white,
      surface: RcbColors.paper,
      onSurface: RcbColors.ink,
      surfaceContainerHighest: RcbColors.surfaceMuted,
    );

    return _buildTheme(scheme: scheme, textColor: RcbColors.ink);
  }

  static ThemeData dark() {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: RcbColors.primary,
      onPrimary: Colors.white,
      secondary: RcbColors.secondary,
      onSecondary: Colors.white,
      error: RcbColors.alert,
      onError: Colors.white,
      surface: RcbColors.night,
      onSurface: RcbColors.paper,
      surfaceContainerHighest: RcbColors.nightMuted,
    );

    return _buildTheme(scheme: scheme, textColor: RcbColors.paper);
  }

  static ThemeData _buildTheme({
    required ColorScheme scheme,
    required Color textColor,
  }) {
    final textTheme = RcbTypography.buildTextTheme(color: textColor);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: textTheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: RcbRadii.buttonBorder,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: RcbSpacing.xl,
            vertical: RcbSpacing.md,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      cardTheme: CardThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: RcbRadii.cardBorder,
        ),
        margin: EdgeInsets.zero,
        elevation: 0,
        color: scheme.surfaceContainerHighest,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: RcbRadii.inputBorder,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
