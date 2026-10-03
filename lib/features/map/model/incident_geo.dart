import 'package:domain/domain.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

/// Poland's bounding box (its extreme points: Opołonek south, Jastrzębia Góra
/// north, Osinów Dolny west, Zosin east). The map never pans outside it.
///
/// flutter_map constrains to a rectangle, not the border itself, so corners
/// of neighbouring countries inside this box stay reachable.
final polandBounds = LatLngBounds(
  const LatLng(49.002, 14.122),
  const LatLng(54.836, 24.146),
);

/// Keeps the whole visible area inside [polandBounds].
final polandCameraConstraint = CameraConstraint.contain(bounds: polandBounds);

/// Radius the resident's "around me" summary covers.
const nearbyRadiusMeters = 2000;

const _distance = Distance();

extension GeoPointLatLng on GeoPoint {
  LatLng get latLng => LatLng(latitude, longitude);
}

extension IncidentDistance on Incident {
  double distanceTo(GeoPoint point) =>
      _distance.as(LengthUnit.Meter, location.latLng, point.latLng);
}

/// "350 m" below a kilometre, "1,2 km" above, in the active locale. The
/// space is non-breaking so the unit never wraps away from its number.
String formatDistance(double meters, String locale) {
  if (meters < 1000) {
    final rounded = (meters / 10).round() * 10;
    return '$rounded\u00A0m';
  }
  final km = NumberFormat('0.0', locale).format(meters / 1000);
  return '$km\u00A0km';
}

/// Nearby list order: active incidents by distance, resolved ones last.
List<Incident> rankByDistance(
  Iterable<Incident> incidents, {
  required GeoPoint origin,
}) {
  final sorted = incidents.toList()
    ..sort((a, b) {
      final aResolved = a.status == IncidentStatus.resolved;
      final bResolved = b.status == IncidentStatus.resolved;
      if (aResolved != bResolved) return aResolved ? 1 : -1;
      return a.distanceTo(origin).compareTo(b.distanceTo(origin));
    });
  return sorted;
}

/// The one incident the resident should read first: the most severe active
/// incident within [nearbyRadiusMeters], nearest first on ties.
Incident? leadIncident(
  Iterable<Incident> incidents, {
  required GeoPoint origin,
}) {
  final nearby = incidents.where(
    (incident) =>
        incident.status != IncidentStatus.resolved &&
        incident.severity != IncidentSeverity.low &&
        incident.distanceTo(origin) <= nearbyRadiusMeters,
  );
  if (nearby.isEmpty) return null;
  return nearby.reduce((best, next) {
    final bySeverity = next.severity.index.compareTo(best.severity.index);
    if (bySeverity != 0) return bySeverity > 0 ? next : best;
    return next.distanceTo(origin) < best.distanceTo(origin) ? next : best;
  });
}
