import 'package:flutter/material.dart';

/// Odblask palette — Battenburg emergency livery on a calm road-bone base.
///
/// Hex values are the canonical source; do not eyeball variants in feature
/// code. Livery colours are reserved for incident layers and severity; the
/// shell stays neutral. If you need a tint/shade not listed here, add it
/// here first.
abstract final class RcbColors {
  // Neutral base — light
  static const bone = Color(0xFFF4F5F0);
  static const boneRaised = Color(0xFFFAFBF6);
  static const boneSunken = Color(0xFFE8EAE2);
  static const hairline = Color(0xFFD2D5CB);
  static const asphalt = Color(0xFF16181B);
  static const asphaltMuted = Color(0xFF4A4F57);

  // Neutral base — dark
  static const night = Color(0xFF121416);
  static const nightRaised = Color(0xFF1B1E21);
  static const nightSunken = Color(0xFF25292D);
  static const nightHairline = Color(0xFF353A40);
  static const nightInk = Color(0xFFEEF0E8);
  static const nightInkMuted = Color(0xFFA9AEB5);

  /// Fluorescent hi-vis yellow-green. Primary action and live state only.
  static const hiVis = Color(0xFFD7F100);

  // Layer liveries
  static const amber = Color(0xFFF08A00);
  static const amberInk = Color(0xFF9A4F00);
  static const signalRed = Color(0xFFE5322D);
  static const patrolBlue = Color(0xFF1E5BFF);

  // GIOŚ air-quality index, official scale, best to worst.
  static const airVeryGood = Color(0xFF57B108);
  static const airGood = Color(0xFFB0DD10);
  static const airModerate = Color(0xFFFFD911);
  static const airSufficient = Color(0xFFE58100);
  static const airBad = Color(0xFFE50000);
  static const airVeryBad = Color(0xFF990000);
}
