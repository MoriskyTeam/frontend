import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Arrow pointing where the wind blows to; [fromDegrees] is the
/// meteorological direction it blows from (0 = north).
class WindArrow extends StatelessWidget {
  const WindArrow({
    required this.fromDegrees,
    required this.semanticLabel,
    this.size = 16,
    this.color,
    super.key,
  });

  final int fromDegrees;
  final String semanticLabel;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Transform.rotate(
        angle: (fromDegrees + 180) * math.pi / 180,
        child: Icon(Icons.navigation_rounded, size: size, color: color),
      ),
    );
  }
}
