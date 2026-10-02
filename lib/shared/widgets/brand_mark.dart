import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/shared/livery/battenburg.dart';
import 'package:flutter/material.dart';

/// CityShield mark: a 2×2 Battenburg block next to the condensed wordmark.
class BrandMark extends StatelessWidget {
  const BrandMark({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      header: true,
      label: name,
      child: ExcludeSemantics(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox.square(
              dimension: 18,
              child: CustomPaint(
                painter: BattenburgFramePainter(
                  primary: RcbColors.asphalt,
                  secondary: RcbColors.hiVis,
                  cell: 9,
                  radius: 2,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              name.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
