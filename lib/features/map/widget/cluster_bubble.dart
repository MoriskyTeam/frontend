import 'dart:math' as math;

import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:flutter/material.dart';

/// Diameter of the largest bubble; also the marker box it is laid out in.
const clusterBubbleExtent = 60.0;

/// Several incidents at one spot: the count on asphalt, ringed by a donut
/// split into each member's livery colour, so the mix is readable at a
/// glance. A serious member adds a hi-vis notch.
class ClusterBubble extends StatelessWidget {
  const ClusterBubble({
    required this.members,
    required this.dimmed,
    required this.semanticLabel,
    required this.onTap,
    super.key,
  });

  final List<Incident> members;
  final bool dimmed;
  final String semanticLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Grows gently with the count, never past the marker box.
    final size = math.min(
      clusterBubbleExtent,
      40 + 6 * math.log(members.length) / math.ln2,
    );
    final serious = members.any(
      (incident) =>
          incident.severity.isHigh &&
          incident.status != IncidentStatus.resolved,
    );
    final count = members.length > 99 ? '99+' : '${members.length}';

    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedOpacity(
          duration: RcbMotion.medium,
          curve: RcbMotion.standard,
          opacity: dimmed ? 0.28 : 1,
          child: Center(
            child: SizedBox.square(
              dimension: size,
              child: CustomPaint(
                painter: _DonutPainter(
                  colors: [for (final m in members) m.livery.fill],
                  serious: serious,
                ),
                child: Center(
                  child: Text(
                    count,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: RcbColors.boneRaised,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  const _DonutPainter({required this.colors, required this.serious});

  final List<Color> colors;
  final bool serious;

  static const _ring = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    final centre = size.center(Offset.zero);
    final radius = size.shortestSide / 2;

    canvas
      ..drawCircle(
        centre.translate(0, 2),
        radius,
        Paint()
          ..color = const Color(0x3316181B)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
      )
      ..drawCircle(centre, radius, Paint()..color = RcbColors.asphalt);

    // Group equal colours so the donut reads as a few clean segments.
    final shares = <Color, int>{};
    for (final color in colors) {
      shares[color] = (shares[color] ?? 0) + 1;
    }
    final ring = Rect.fromCircle(
      center: centre,
      radius: radius - _ring / 2 - 1,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _ring;
    const gap = 0.06;
    var angle = -math.pi / 2;
    for (final MapEntry(key: color, value: count) in shares.entries) {
      final sweep = 2 * math.pi * count / colors.length;
      canvas.drawArc(
        ring,
        angle + (shares.length > 1 ? gap / 2 : 0),
        sweep - (shares.length > 1 ? gap : 0),
        false,
        paint..color = color,
      );
      angle += sweep;
    }

    if (serious) {
      final notch = centre + Offset(radius * 0.72, -radius * 0.72);
      canvas
        ..drawCircle(notch, 4.5, Paint()..color = RcbColors.hiVis)
        ..drawCircle(
          notch,
          4.5,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5
            ..color = RcbColors.asphalt,
        );
    }
  }

  @override
  bool shouldRepaint(_DonutPainter old) =>
      old.serious != serious || !_sameColors(old.colors, colors);

  static bool _sameColors(List<Color> a, List<Color> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
