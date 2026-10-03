import 'dart:math' as math;

import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/model/map_projection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';

/// Weather warning areas: a slowly travelling red-and-bone chevron border
/// with a breathing glow along its inner edge.
///
/// Only the rim is tinted, so a city-wide area never washes over the whole
/// basemap; the selected area gets a light flat fill on top.
class WarningZoneLayer extends HookWidget {
  const WarningZoneLayer({
    required this.warnings,
    required this.selectedId,
    super.key,
  });

  final List<Incident> warnings;
  final String? selectedId;

  static const _loop = Duration(seconds: 6);

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final controller = useAnimationController(duration: _loop);
    useEffect(() {
      if (reduceMotion || warnings.isEmpty) {
        controller.stop();
      } else {
        controller.repeat();
      }
      return null;
    }, [reduceMotion, warnings.isEmpty]);

    if (warnings.isEmpty) return const SizedBox.shrink();
    final camera = MapCamera.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final zones = [
      for (final warning in warnings)
        (
          centre: camera.getOffsetFromOrigin(warning.location.latLng),
          radius: camera.metersToPixels(
            warning.location.latLng,
            warning.areaRadiusMeters!.toDouble(),
          ),
          selected: warning.id == selectedId,
        ),
    ];

    return MobileLayerTransformer(
      child: IgnorePointer(
        child: CustomPaint(
          size: Size.infinite,
          painter: _WarningZonePainter(
            zones: zones,
            phase: controller,
            gap: dark ? RcbColors.night : RcbColors.boneRaised,
          ),
        ),
      ),
    );
  }
}

typedef _Zone = ({Offset centre, double radius, bool selected});

class _WarningZonePainter extends CustomPainter {
  _WarningZonePainter({
    required this.zones,
    required this.phase,
    required this.gap,
  }) : super(repaint: phase);

  final List<_Zone> zones;
  final Animation<double> phase;
  final Color gap;

  static const _band = 4.0;
  static const _dash = 12.0;
  static const _glow = 28.0;
  static const _maxDashes = 1440;

  @override
  void paint(Canvas canvas, Size size) {
    final viewport = Offset.zero & size;
    final t = phase.value;
    // One breath per loop: 0 → 1 → 0.
    final breath = 0.5 - 0.5 * math.cos(2 * math.pi * t);

    for (final zone in zones) {
      final arc = _visibleArc(zone, viewport);
      if (arc == null) continue;
      final (start, sweep) = arc;
      final rect = Rect.fromCircle(center: zone.centre, radius: zone.radius);

      if (zone.selected) {
        canvas.drawCircle(
          zone.centre,
          zone.radius,
          Paint()..color = RcbColors.signalRed.withValues(alpha: 0.1),
        );
      }

      // Inner glow, a ring of fading red just inside the border, then the
      // chevron border: a bone band with red dashes travelling clockwise.
      final glow = math.min(_glow, zone.radius);
      final inner = (zone.radius - glow) / zone.radius;
      canvas
        ..drawCircle(
          zone.centre,
          zone.radius - glow / 2,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = glow
            ..shader = RadialGradient(
              colors: [
                RcbColors.signalRed.withValues(alpha: 0),
                RcbColors.signalRed.withValues(alpha: 0.08 + 0.1 * breath),
              ],
              stops: [inner, 1],
            ).createShader(rect),
        )
        ..drawArc(
          rect,
          start,
          sweep,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = _band + 1.5
            ..color = gap.withValues(alpha: 0.9),
        );
      final circumference = 2 * math.pi * zone.radius;
      final count = math.min(_maxDashes, (circumference / (_dash * 2)).floor());
      if (count < 4) continue;
      final step = 2 * math.pi / count;
      final dash = step / 2;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _band
        ..color = RcbColors.signalRed;
      final first = ((start / step).floor() - 1) * step + t * step;
      for (var angle = first; angle < start + sweep; angle += step) {
        canvas.drawArc(rect, angle, dash, false, paint);
      }
    }
  }

  /// The part of the border inside [viewport] as (start angle, sweep), or
  /// null when none of it is visible.
  (double, double)? _visibleArc(_Zone zone, Rect viewport) {
    final reach = viewport.inflate(_glow);
    final centre = zone.centre;
    final r = zone.radius;
    final nearest = Offset(
      centre.dx.clamp(reach.left, reach.right),
      centre.dy.clamp(reach.top, reach.bottom),
    );
    // Border entirely outside the viewport.
    if ((nearest - centre).distance > r) return null;
    final farthest = [
      reach.topLeft,
      reach.topRight,
      reach.bottomLeft,
      reach.bottomRight,
    ].map((corner) => (corner - centre).distance).reduce(math.max);
    // Viewport entirely inside the zone, border off screen.
    if (farthest < r - _glow) return null;
    // Only the side facing the viewport can be on screen; every viewport
    // point lies within [reachRadius] of its centre.
    final toView = reach.center - centre;
    final reachRadius = reach.size.longestSide;
    if (toView.distance <= reachRadius) return (0, 2 * math.pi);
    final spread = math.asin(reachRadius / toView.distance);
    final facing = math.atan2(toView.dy, toView.dx);
    final half = spread + 0.05;
    return (facing - half, half * 2);
  }

  @override
  bool shouldRepaint(_WarningZonePainter old) =>
      old.zones != zones || old.gap != gap;
}
