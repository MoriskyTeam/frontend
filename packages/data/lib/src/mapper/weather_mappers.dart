import 'package:data/src/model/weather/synop_reading_dto.dart';
import 'package:data/src/model/weather/synop_station_dto.dart';
import 'package:domain/domain.dart';

extension SynopStationListMapper on List<SynopStationDTO> {
  /// Each station with a position and an observation becomes a weather
  /// station incident; the rest are left off the map.
  List<Incident> toWeatherIncidents({
    required List<SynopReadingDTO> readings,
  }) {
    final byStation = {
      for (final reading in readings)
        if (reading.stationId case final id?) id: reading,
    };
    return [
      for (final station in this)
        ?station.toWeatherIncident(reading: byStation[station.stationId]),
    ];
  }
}

extension SynopStationMapper on SynopStationDTO {
  Incident? toWeatherIncident({required SynopReadingDTO? reading}) {
    final stationId = this.stationId;
    final lat = this.lat;
    final lng = this.lng;
    if (stationId == null || lat == null || lng == null || reading == null) {
      return null;
    }
    final weather = reading.toDomain();
    return Incident(
      id: 'synop-$stationId',
      layer: IncidentLayer.weather,
      category: IncidentCategory.weatherStation,
      severity: weather.toSeverity(),
      status: IncidentStatus.confirmed,
      source: IncidentSource.imgw,
      // Untitled, so it reads as "Weather station" over its place name.
      title: '',
      description: '',
      address: name ?? '',
      location: GeoPoint(latitude: lat, longitude: lng),
      reportedAt: reading.measuredAt ?? DateTime.now(),
      updatedAt: reading.updatedAt,
      confirmations: 0,
      areaRadiusMeters: null,
      airReading: null,
      weatherReading: weather,
      photoPath: null,
      reportedByMe: false,
    );
  }
}

extension SynopReadingMapper on SynopReadingDTO {
  WeatherReading toDomain() => WeatherReading(
    temperature: temperature,
    windSpeed: windSpeed,
    windDirection: windDirection,
    humidity: humidity,
    precipitation: precipitation,
    pressure: pressure,
  );
}

extension on WeatherReading {
  /// Conditions worth noticing raise the station to medium; IMGW warnings
  /// stay the source of anything serious.
  IncidentSeverity toSeverity() {
    final notable =
        (windSpeed ?? 0) >= 15 ||
        (temperature ?? 0) >= 30 ||
        (temperature ?? 0) <= -15 ||
        (precipitation ?? 0) >= 10;
    return notable ? IncidentSeverity.medium : IncidentSeverity.low;
  }
}
