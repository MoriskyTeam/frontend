import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test(
    'GIVEN a row from the Supabase incidents table,\n'
    'WHEN decoded and mapped,\n'
    'THEN the domain incident carries location, reading and ownership',
    () {
      // GIVEN — integer coordinates and jsonb exactly as PostgREST sends them.
      final row = <String, dynamic>{
        'id': 'air-krasinskiego',
        'layer': 'air_quality',
        'category': 'air_quality',
        'severity': 'medium',
        'status': 'confirmed',
        'source': 'gios',
        'title': 'Stacja Al. Krasińskiego',
        'description': null,
        'address': 'Al. Krasińskiego',
        'lat': 50,
        'lng': 19.9265,
        'reported_at': '2026-10-03T08:00:00+00:00',
        'updated_at': null,
        'confirmations': 0,
        'area_radius_meters': null,
        'air_reading': {'pm25': 62, 'pm10': 88},
        'photo_path': null,
        'reporter_id': 'user-1',
        'reported_by_me': true,
      };

      // WHEN
      final incident = IncidentDTO.fromJson(row).toDomain();

      // THEN
      expect(incident.location.latitude, 50.0);
      expect(incident.layer, IncidentLayer.airQuality);
      expect(incident.airReading?.level, AirQualityLevel.sufficient);
      expect(incident.description, isEmpty);
      expect(incident.reportedByMe, isTrue);
    },
  );
}
