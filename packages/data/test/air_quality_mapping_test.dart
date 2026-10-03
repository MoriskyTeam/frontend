import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

GiosStationDTO _station({int stationId = 400, double? lat = 50.0576}) =>
    GiosStationDTO.fromJson({
      'station_id': stationId,
      'code': 'MpKrakAlKras',
      'name': 'Kraków, Aleja Krasińskiego',
      'city': 'Kraków',
      'street': 'al. Krasińskiego',
      'lat': lat,
      'lng': 19.9265,
      'pm25_sensor_id': 2750,
      'pm10_sensor_id': 2747,
      'discovered_at': '2026-10-01T00:00:00+00:00',
    });

GiosReadingDTO _reading({
  required String pollutant,
  required num value,
  int stationId = 400,
  String measuredAt = '2026-10-03T08:00:00+00:00',
}) => GiosReadingDTO.fromJson({
  'sensor_id': pollutant == 'PM2.5' ? 2750 : 2747,
  'station_id': stationId,
  'pollutant': pollutant,
  'value': value,
  'measured_at': measuredAt,
  'updated_at': '2026-10-03T08:05:00+00:00',
});

void main() {
  test(
    'GIVEN a GIOŚ station with PM2.5 and PM10 readings,\n'
    'WHEN mapped to incidents,\n'
    'THEN it becomes an air-quality incident graded by the worse pollutant',
    () {
      // GIVEN — integer values exactly as PostgREST may send them.
      final readings = [
        _reading(pollutant: 'PM2.5', value: 62),
        _reading(
          pollutant: 'PM10',
          value: 120.5,
          measuredAt: '2026-10-03T09:00:00+00:00',
        ),
      ];

      // WHEN
      final incidents = [_station()].toAirIncidents(readings: readings);

      // THEN
      final incident = incidents.single;
      expect(incident.id, 'gios-400');
      expect(incident.layer, IncidentLayer.airQuality);
      expect(incident.source, IncidentSource.gios);
      expect(incident.title, 'Kraków, Aleja Krasińskiego');
      expect(incident.address, 'al. Krasińskiego');
      expect(incident.airReading?.pm25, 62.0);
      expect(incident.airReading?.pm10, 120.5);
      expect(incident.airReading?.level, AirQualityLevel.bad);
      expect(incident.severity, IncidentSeverity.high);
      expect(incident.reportedAt, DateTime.utc(2026, 10, 3, 9));
    },
  );

  test(
    'GIVEN a GIOŚ station with only a PM10 reading,\n'
    'WHEN mapped to incidents,\n'
    'THEN PM2.5 stays empty and the grade comes from PM10',
    () {
      // GIVEN
      final readings = [_reading(pollutant: 'PM10', value: 25)];

      // WHEN
      final incident = [_station()].toAirIncidents(readings: readings).single;

      // THEN
      expect(incident.airReading?.pm25, isNull);
      expect(incident.airReading?.level, AirQualityLevel.good);
      expect(incident.severity, IncidentSeverity.low);
    },
  );

  test(
    'GIVEN stations without readings or position and a stray reading,\n'
    'WHEN mapped to incidents,\n'
    'THEN only stations that can be shown on the map are kept',
    () {
      // GIVEN
      final stations = [
        _station(),
        _station(stationId: 401),
        _station(stationId: 402, lat: null),
      ];
      final readings = [
        _reading(pollutant: 'PM2.5', value: 30),
        _reading(pollutant: 'PM2.5', value: 30, stationId: 402),
        _reading(pollutant: 'PM10', value: 300, stationId: 999),
      ];

      // WHEN
      final incidents = stations.toAirIncidents(readings: readings);

      // THEN
      expect(incidents.map((incident) => incident.id), ['gios-400']);
      expect(incidents.single.airReading?.level, AirQualityLevel.good);
    },
  );
}
