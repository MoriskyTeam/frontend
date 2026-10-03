import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Builds the Odblask light + dark ThemeData.
///
/// The shell is neutral; `primary` is the hi-vis action colour and is used
/// for the one primary action per screen and live state.
abstract final class RcbTheme {
  static ThemeData light() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: RcbColors.hiVis,
      onPrimary: RcbColors.asphalt,
      secondary: RcbColors.asphalt,
      onSecondary: RcbColors.bone,
      tertiary: RcbColors.patrolBlue,
      onTertiary: Colors.white,
      error: RcbColors.signalRed,
      onError: Colors.white,
      surface: RcbColors.bone,
      onSurface: RcbColors.asphalt,
      onSurfaceVariant: RcbColors.asphaltMuted,
      surfaceContainerLowest: RcbColors.boneRaised,
      surfaceContainerLow: RcbColors.boneRaised,
      surfaceContainer: RcbColors.bone,
      surfaceContainerHigh: RcbColors.boneSunken,
      surfaceContainerHighest: RcbColors.boneSunken,
      outline: RcbColors.asphaltMuted,
      outlineVariant: RcbColors.hairline,
      inverseSurface: RcbColors.asphalt,
      onInverseSurface: RcbColors.bone,
      shadow: Color(0x2916181B),
    );
    return _buildTheme(scheme);
  }

  static ThemeData dark() {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: RcbColors.hiVis,
      onPrimary: RcbColors.asphalt,
      secondary: RcbColors.nightInk,
      onSecondary: RcbColors.night,
      tertiary: Color(0xFF6E95FF),
      onTertiary: RcbColors.night,
      error: Color(0xFFFF5A52),
      onError: RcbColors.night,
      surface: RcbColors.night,
      onSurface: RcbColors.nightInk,
      onSurfaceVariant: RcbColors.nightInkMuted,
      surfaceContainerLowest: RcbColors.nightRaised,
      surfaceContainerLow: RcbColors.nightRaised,
      surfaceContainer: RcbColors.nightRaised,
      surfaceContainerHigh: RcbColors.nightSunken,
      surfaceContainerHighest: RcbColors.nightSunken,
      outline: RcbColors.nightInkMuted,
      outlineVariant: RcbColors.nightHairline,
      inverseSurface: RcbColors.nightInk,
      onInverseSurface: RcbColors.night,
      shadow: Color(0x66000000),
    );
    return _buildTheme(scheme);
  }

  static ThemeData _buildTheme(ColorScheme scheme) {
    final textTheme = RcbTypography.buildTextTheme(color: scheme.onSurface);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: textTheme,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: scheme.onSurface,
        selectionColor: RcbColors.hiVis.withValues(alpha: 0.55),
        selectionHandleColor: scheme.onSurface,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(64, 52),
          shape: const RoundedRectangleBorder(
            borderRadius: RcbRadii.buttonBorder,
          ),
          padding: const EdgeInsets.symmetric(horizontal: RcbSpacing.xl),
          textStyle: textTheme.labelLarge,
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHighest,
          disabledForegroundColor: scheme.onSurfaceVariant,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, 48),
          shape: const RoundedRectangleBorder(
            borderRadius: RcbRadii.buttonBorder,
          ),
          side: BorderSide(color: scheme.onSurface),
          foregroundColor: scheme.onSurface,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: scheme.onSurface,
          textStyle: textTheme.labelLarge,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        extendedTextStyle: textTheme.labelLarge,
        shape: const RoundedRectangleBorder(
          borderRadius: RcbRadii.buttonBorder,
          side: BorderSide(color: RcbColors.asphalt, width: 1.5),
        ),
        elevation: 3,
        highlightElevation: 4,
      ),
      chipTheme: ChipThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: RcbRadii.buttonBorder,
        ),
        side: BorderSide(color: scheme.outlineVariant),
        backgroundColor: scheme.surfaceContainerLowest,
        selectedColor: scheme.inverseSurface,
        labelStyle: textTheme.labelMedium,
        secondaryLabelStyle: textTheme.labelMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
        checkmarkColor: scheme.onInverseSurface,
        showCheckmark: false,
        padding: const EdgeInsets.symmetric(
          horizontal: RcbSpacing.xs,
          vertical: RcbSpacing.xs,
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: RcbRadii.cardBorder,
          side: BorderSide(color: scheme.outlineVariant),
        ),
        margin: EdgeInsets.zero,
        elevation: 0,
        color: scheme.surfaceContainerLowest,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLowest,
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        border: OutlineInputBorder(
          borderRadius: RcbRadii.inputBorder,
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: RcbRadii.inputBorder,
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: RcbRadii.inputBorder,
          borderSide: BorderSide(color: scheme.onSurface, width: 2),
        ),
        contentPadding: const EdgeInsets.all(RcbSpacing.lg),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
        // Hi-vis only reads on the dark snackbar of the light theme.
        actionTextColor: scheme.brightness == Brightness.dark
            ? RcbColors.asphalt
            : RcbColors.hiVis,
        shape: const RoundedRectangleBorder(
          borderRadius: RcbRadii.cardBorder,
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: scheme.brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: RcbRadii.sheetBorder,
        ),
        showDragHandle: true,
        dragHandleColor: scheme.outline,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.onSurface,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(
          scheme.onSurface.withValues(alpha: 0.35),
        ),
        radius: RcbRadii.tight,
        thickness: const WidgetStatePropertyAll(4),
      ),
    );
  }
}
