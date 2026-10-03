import 'package:flutter/widgets.dart';

/// Corner tokens. Livery is cut, not inflated: corners stay tight.
abstract final class RcbRadii {
  static const tight = Radius.circular(4);
  static const card = Radius.circular(8);
  static const button = Radius.circular(6);
  static const input = Radius.circular(6);
  static const sheet = Radius.circular(14);
  static const pill = Radius.circular(999);

  static const tightBorder = BorderRadius.all(tight);
  static const cardBorder = BorderRadius.all(card);
  static const buttonBorder = BorderRadius.all(button);
  static const inputBorder = BorderRadius.all(input);
  static const pillBorder = BorderRadius.all(pill);
  static const sheetBorder = BorderRadius.vertical(top: sheet);
}

abstract final class RcbSpacing {
  static const xxs = 2.0;
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const huge = 48.0;
}

abstract final class RcbMotion {
  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasized = Curves.easeOutExpo;

  static const Duration quick = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 220);
  static const Duration camera = Duration(milliseconds: 520);

  /// The odblask sweep — light crossing retroreflective tape.
  static const Duration sweep = Duration(milliseconds: 1100);
  static const Duration pulse = Duration(milliseconds: 1800);
}
