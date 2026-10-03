import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

const Map<String, dynamic> _station = {
  'station_id': 12566,
  'name': 'Kraków',
  'lat': 50.063889,
  'lng': 19.958611,
};

Map<String, dynamic> _reading({double windSpeed = 0}) => {
  'station_id': 12566,
  'temperature': 9.9,
  'wind_speed': windSpeed,
  'wind_direction': 0,
  'humidity': 78.6,
  'precipitation': 0,
  'pressure': 1031.2,
  'measured_at': '2026-10-03T18:00:00+00:00',
  'updated_at': '2026-10-03T20:52:56.069495+00:00',
};

void main() {
  test(
    'GIVEN an IMGW synoptic station and its reading,\n'
    'WHEN joined on station_id and mapped,\n'
    'THEN it becomes a weather station incident carrying the observation',
    () {
      final incidents = [SynopStationDTO.fromJson(_station)].toWeatherIncidents(
        readings: [SynopReadingDTO.fromJson(_reading())],
      );

      final incident = incidents.single;
      expect(incident.id, 'synop-12566');
      expect(incident.layer, IncidentLayer.weather);
      expect(incident.category, IncidentCategory.weatherStation);
      expect(incident.source, IncidentSource.imgw);
      expect(incident.severity, IncidentSeverity.low);
      expect(incident.address, 'Kraków');
      expect(incident.location.latitude, 50.063889);
      expect(incident.reportedAt, DateTime.utc(2026, 10, 3, 18));
      expect(
        incident.weatherReading,
        const WeatherReading(
          temperature: 9.9,
          windSpeed: 0,
          windDirection: 0,
          humidity: 78.6,
          precipitation: 0,
          pressure: 1031.2,
        ),
      );
    },
  );

  test(
    'GIVEN a station without a reading or without a position,\n'
    'WHEN mapped,\n'
    'THEN it is left off the map',
    () {
      expect(
        [SynopStationDTO.fromJson(_station)].toWeatherIncidents(readings: []),
        isEmpty,
      );
      expect(
        [
          SynopStationDTO.fromJson({..._station, 'lat': null}),
        ].toWeatherIncidents(readings: [SynopReadingDTO.fromJson(_reading())]),
        isEmpty,
      );
    },
  );

  test(
    'GIVEN a gale at the station,\n'
    'WHEN mapped,\n'
    'THEN the station is raised to medium severity',
    () {
      final incident = [SynopStationDTO.fromJson(_station)]
          .toWeatherIncidents(
            readings: [SynopReadingDTO.fromJson(_reading(windSpeed: 17))],
          )
          .single;

      expect(incident.severity, IncidentSeverity.medium);
    },
  );
}
