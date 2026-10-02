import 'package:flutter/widgets.dart';

/// Border-radius tokens. Shared across all features.
abstract final class RcbRadii {
  static const card = Radius.circular(16);
  static const button = Radius.circular(12);
  static const input = Radius.circular(8);
  static const pill = Radius.circular(999);

  static const cardBorder = BorderRadius.all(card);
  static const buttonBorder = BorderRadius.all(button);
  static const inputBorder = BorderRadius.all(input);
  static const pillBorder = BorderRadius.all(pill);
}

abstract final class RcbSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const huge = 48.0;
}

abstract final class RcbMotion {
  /// Default tap-feedback curve — `cubic-bezier(0.34, 1.56, 0.64, 1)` —
  /// gives a small bounce out without overshooting too far.
  static const Curve tapBounce = Cubic(0.34, 1.56, 0.64, 1);

  static const Duration tapFeedback = Duration(milliseconds: 120);
  static const Duration pageTransition = Duration(milliseconds: 240);
}
