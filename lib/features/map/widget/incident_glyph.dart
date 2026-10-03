import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/shared/livery/battenburg.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:flutter/material.dart';

/// List-sized version of the map marker, so a row and its pin read as the
/// same object.
class IncidentGlyph extends StatelessWidget {
  const IncidentGlyph({required this.incident, this.size = 36, super.key});

  final Incident incident;
  final double size;

  @override
  Widget build(BuildContext context) {
    final livery = incident.livery;
    final reading = incident.airReading;
    final iconSize = size * 0.55;

    if (reading != null) {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: livery.fill,
          shape: BoxShape.circle,
          border: Border.all(color: RcbColors.asphalt, width: 1.25),
        ),
        child: Text(
          reading.headline?.round().toString() ?? '–',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: livery.onFill,
            fontWeight: FontWeight.w800,
            height: 1,
            fontFeatures: RcbTypography.tabular,
          ),
        ),
      );
    }

    final resolved = incident.status == IncidentStatus.resolved;
    if (resolved || incident.severity == IncidentSeverity.low) {
      final ink = resolved
          ? Theme.of(context).colorScheme.onSurfaceVariant
          : livery.outlineInk;
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: RcbRadii.tightBorder,
          border: Border.all(color: ink, width: 2),
        ),
        child: Icon(incident.category.icon, size: iconSize, color: ink),
      );
    }

    if (incident.severity == IncidentSeverity.medium) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: livery.fill,
          borderRadius: RcbRadii.tightBorder,
          border: Border.all(color: RcbColors.asphalt, width: 1.25),
        ),
        child: Icon(
          incident.category.icon,
          size: iconSize,
          color: livery.onFill,
        ),
      );
    }

    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: BattenburgFramePainter(
          primary: livery.fill,
          secondary: livery.checker,
          cell: size / 8,
          radius: 4,
        ),
        child: Center(
          child: Container(
            width: size * 0.68,
            height: size * 0.68,
            decoration: BoxDecoration(
              color: livery.fill,
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: livery.checker, width: 1.5),
            ),
            child: Icon(
              incident.category.icon,
              size: iconSize * 0.8,
              color: livery.onFill,
            ),
          ),
        ),
      ),
    );
  }
}
