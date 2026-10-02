import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:flutter_test/flutter_test.dart';

Incident _incident({
  required String id,
  required double lat,
  IncidentSeverity severity = IncidentSeverity.medium,
  IncidentStatus status = IncidentStatus.reported,
}) => Incident(
  id: id,
  layer: IncidentLayer.infrastructure,
  category: IncidentCategory.powerOutage,
  severity: severity,
  status: status,
  source: IncidentSource.city19115,
  title: id,
  description: '',
  address: '',
  location: GeoPoint(latitude: lat, longitude: 19.9373),
  reportedAt: DateTime(2026),
  updatedAt: null,
  confirmations: 0,
  areaRadiusMeters: null,
  airReading: null,
  photoPath: null,
  reportedByMe: false,
);

void main() {
  const origin = GeoPoint(latitude: 50.0617, longitude: 19.9373);

  test(
    'GIVEN active and resolved incidents,\n'
    'WHEN ranked by distance,\n'
    'THEN active ones come first, nearest first, resolved last',
    () {
      final ranked = rankByDistance([
        _incident(id: 'far', lat: 50.08),
        _incident(id: 'done', lat: 50.0618, status: IncidentStatus.resolved),
        _incident(id: 'near', lat: 50.063),
      ], origin: origin);

      expect(ranked.map((i) => i.id), ['near', 'far', 'done']);
    },
  );

  test(
    'GIVEN a nearer medium and a further high incident within 2 km,\n'
    'WHEN picking the lead,\n'
    'THEN the high-severity one leads',
    () {
      final lead = leadIncident([
        _incident(id: 'medium', lat: 50.0625),
        _incident(id: 'high', lat: 50.07, severity: IncidentSeverity.high),
      ], origin: origin);

      expect(lead?.id, 'high');
    },
  );

  test(
    'GIVEN only low-severity or distant incidents,\n'
    'WHEN picking the lead,\n'
    'THEN there is no lead',
    () {
      final lead = leadIncident([
        _incident(id: 'low', lat: 50.062, severity: IncidentSeverity.low),
        _incident(id: 'distant', lat: 50.2, severity: IncidentSeverity.high),
      ], origin: origin);

      expect(lead, isNull);
    },
  );

  test('formats distance in metres and kilometres', () {
    expect(formatDistance(347, 'pl'), '350\u00A0m');
    expect(formatDistance(1234, 'pl'), '1,2\u00A0km');
  });
}
