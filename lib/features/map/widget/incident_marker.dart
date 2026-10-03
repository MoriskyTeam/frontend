import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/features/map/model/weather_format.dart';
import 'package:dynamic_rcb_alerts/shared/livery/battenburg.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:dynamic_rcb_alerts/shared/livery/odblask_sweep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Outer box every marker is laid out in; keeps the 48 dp touch target.
const incidentMarkerExtent = 56.0;

/// Map marker in the livery of its layer.
///
/// Low severity is hollow, medium is a solid livery block, high gets a
/// Battenburg frame and a slow pulse. Air stations are round and show their
/// PM2.5 reading, weather stations their temperature. Resolved incidents
/// are struck through and faded.
class IncidentMarker extends StatelessWidget {
  const IncidentMarker({
    required this.incident,
    required this.selected,
    required this.dimmed,
    required this.arrived,
    required this.semanticLabel,
    required this.onTap,
    super.key,
  });

  final Incident incident;
  final bool selected;
  final bool dimmed;
  final bool arrived;
  final String semanticLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final resolved = incident.status == IncidentStatus.resolved;
    final pulsing = incident.severity.isHigh && !resolved;

    return Semantics(
      button: true,
      selected: selected,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedOpacity(
          duration: RcbMotion.medium,
          curve: RcbMotion.standard,
          opacity: dimmed ? 0.28 : (resolved ? 0.55 : 1),
          child: AnimatedScale(
            duration: RcbMotion.medium,
            curve: RcbMotion.standard,
            scale: selected ? 1.18 : 1,
            child: SizedBox.square(
              dimension: incidentMarkerExtent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (pulsing) _Pulse(color: incident.livery.fill),
                  OdblaskSweep(
                    active: arrived,
                    child: switch (incident) {
                      Incident(airReading: _?) => _StationBody(
                        incident: incident,
                        selected: selected,
                      ),
                      Incident(weatherReading: final weather?) =>
                        _WeatherStationBody(
                          reading: weather,
                          selected: selected,
                        ),
                      _ => _IncidentBody(
                        incident: incident,
                        selected: selected,
                      ),
                    },
                  ),
                  if (resolved) const _Strike(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IncidentBody extends StatelessWidget {
  const _IncidentBody({required this.incident, required this.selected});

  final Incident incident;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final livery = incident.livery;
    final icon = incident.category.icon;
    final ring = selected
        ? Border.all(color: RcbColors.asphalt, width: 2.5)
        : Border.all(color: RcbColors.asphalt, width: 1.25);
    const shadow = [
      BoxShadow(
        color: Color(0x3316181B),
        offset: Offset(0, 2),
        blurRadius: 6,
      ),
    ];

    switch (incident.severity) {
      case IncidentSeverity.low:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: RcbColors.boneRaised,
            borderRadius: RcbRadii.tightBorder,
            border: selected
                ? Border.all(color: RcbColors.asphalt, width: 2.5)
                : Border.all(color: livery.outlineInk, width: 2),
            boxShadow: shadow,
          ),
          child: Icon(icon, size: 18, color: livery.outlineInk),
        );
      case IncidentSeverity.medium:
        return Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: livery.fill,
            borderRadius: RcbRadii.tightBorder,
            border: ring,
            boxShadow: shadow,
          ),
          child: Icon(icon, size: 20, color: livery.onFill),
        );
      case IncidentSeverity.high:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: RcbRadii.tightBorder,
            border: ring,
            boxShadow: shadow,
          ),
          child: CustomPaint(
            painter: BattenburgFramePainter(
              primary: livery.fill,
              secondary: livery.checker,
              cell: 5.25,
              radius: 3,
            ),
            child: Center(
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: livery.fill,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  border: Border.all(color: livery.checker, width: 1.5),
                ),
                child: Icon(icon, size: 18, color: livery.onFill),
              ),
            ),
          ),
        );
    }
  }
}

class _StationBody extends StatelessWidget {
  const _StationBody({required this.incident, required this.selected});

  final Incident incident;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final livery = incident.livery;
    final reading = incident.airReading!;
    final value = reading.headline?.round().toString() ?? '–';
    return Container(
      width: 38,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: livery.fill,
        shape: BoxShape.circle,
        border: Border.all(
          color: RcbColors.asphalt,
          width: selected ? 2.5 : 1.25,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3316181B),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text(
        value,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: livery.onFill,
          fontWeight: FontWeight.w800,
          height: 1,
          fontFeatures: RcbTypography.tabular,
        ),
      ),
    );
  }
}

/// A weather station: a bone disc with the temperature, ringed in asphalt so
/// it reads as a measurement rather than a red warning.
class _WeatherStationBody extends StatelessWidget {
  const _WeatherStationBody({required this.reading, required this.selected});

  final WeatherReading reading;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: RcbColors.boneRaised,
        shape: BoxShape.circle,
        border: Border.all(
          color: RcbColors.asphalt,
          width: selected ? 2.5 : 1.25,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3316181B),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text(
        reading.temperatureShort,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: RcbColors.asphalt,
          fontWeight: FontWeight.w800,
          height: 1,
          fontFeatures: RcbTypography.tabular,
        ),
      ),
    );
  }
}

class _Strike extends StatelessWidget {
  const _Strike();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: SizedBox.square(
        dimension: 34,
        child: CustomPaint(painter: _StrikePainter()),
      ),
    );
  }
}

class _StrikePainter extends CustomPainter {
  const _StrikePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, 0),
      Paint()
        ..color = RcbColors.asphalt
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_StrikePainter oldDelegate) => false;
}

/// Slow expanding ring behind high-severity markers.
class _Pulse extends HookWidget {
  const _Pulse({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: RcbMotion.pulse);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    useEffect(() {
      if (reduceMotion) {
        controller.stop();
      } else {
        controller.repeat();
      }
      return null;
    }, [reduceMotion]);

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final t = Curves.easeOut.transform(controller.value);
          return Container(
            width: 40 + 16 * t,
            height: 40 + 16 * t,
            decoration: BoxDecoration(
              borderRadius: RcbRadii.cardBorder,
              border: Border.all(
                color: color.withValues(alpha: (1 - t) * 0.8),
                width: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
