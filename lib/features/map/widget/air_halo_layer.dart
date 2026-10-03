import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/model/map_projection.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// Soft index-coloured glow around every GIOŚ station, so neighbouring
/// readings blend into a picture of the air over the city.
class AirHaloLayer extends StatelessWidget {
  const AirHaloLayer({
    required this.incidents,
    required this.dimmed,
    super.key,
  });

  final List<Incident> incidents;

  /// Something is selected; the halos step back behind it.
  final bool dimmed;

  /// Roughly the area one urban station speaks for.
  static const _radiusMeters = 1400.0;

  /// Keeps halos readable when zoomed out over the whole city.
  static const _minRadius = 34.0;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final strength = (dark ? 0.30 : 0.38) * (dimmed ? 0.45 : 1);
    final halos = [
      for (final incident in incidents)
        if (incident.airReading != null && incident.isActive)
          (
            centre: camera.getOffsetFromOrigin(incident.location.latLng),
            radius: camera
                .metersToPixels(incident.location.latLng, _radiusMeters)
                .clamp(_minRadius, double.infinity),
            color: incident.livery.fill,
          ),
    ];
    if (halos.isEmpty) return const SizedBox.shrink();

    return MobileLayerTransformer(
      child: IgnorePointer(
        child: CustomPaint(
          size: Size.infinite,
          painter: _AirHaloPainter(halos: halos, strength: strength),
        ),
      ),
    );
  }
}

typedef _Halo = ({Offset centre, double radius, Color color});

class _AirHaloPainter extends CustomPainter {
  const _AirHaloPainter({required this.halos, required this.strength});

  final List<_Halo> halos;
  final double strength;

  @override
  void paint(Canvas canvas, Size size) {
    final viewport = Offset.zero & size;
    for (final halo in halos) {
      final bounds = Rect.fromCircle(center: halo.centre, radius: halo.radius);
      if (!bounds.overlaps(viewport)) continue;
      canvas.drawCircle(
        halo.centre,
        halo.radius,
        Paint()
          ..shader = RadialGradient(
            colors: [
              halo.color.withValues(alpha: strength),
              halo.color.withValues(alpha: strength * 0.55),
              halo.color.withValues(alpha: 0),
            ],
            stops: const [0, 0.45, 1],
          ).createShader(bounds),
      );
    }
  }

  @override
  bool shouldRepaint(_AirHaloPainter old) =>
      old.halos != halos || old.strength != strength;
}
