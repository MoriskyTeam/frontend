import 'package:data/src/model/air_quality/gios_reading_dto.dart';
import 'package:data/src/model/air_quality/gios_station_dto.dart';
import 'package:domain/domain.dart';

extension GiosStationListMapper on List<GiosStationDTO> {
  /// Each station with at least one PM reading becomes an air-quality
  /// incident; stations without readings (or without a position) are left
  /// off the map.
  List<Incident> toAirIncidents({required List<GiosReadingDTO> readings}) {
    final byStation = <int, List<GiosReadingDTO>>{};
    for (final reading in readings) {
      final stationId = reading.stationId;
      if (stationId == null || reading.value == null) continue;
      (byStation[stationId] ??= []).add(reading);
    }
    return [
      for (final station in this)
        ?station.toAirIncident(
          readings: byStation[station.stationId] ?? const [],
        ),
    ];
  }
}

extension GiosStationMapper on GiosStationDTO {
  Incident? toAirIncident({required List<GiosReadingDTO> readings}) {
    final stationId = this.stationId;
    final lat = this.lat;
    final lng = this.lng;
    if (stationId == null || lat == null || lng == null) return null;

    double? valueOf(String pollutant) => readings
        .where((reading) => reading.pollutant == pollutant)
        .firstOrNull
        ?.value;
    final pm25 = valueOf('PM2.5');
    final pm10 = valueOf('PM10');
    final level = AirQualityLevel.fromReadings(pm25: pm25, pm10: pm10);
    if (level == null) return null;

    return Incident(
      id: 'gios-$stationId',
      layer: IncidentLayer.airQuality,
      category: IncidentCategory.airQuality,
      severity: level.toSeverity(),
      status: IncidentStatus.confirmed,
      source: IncidentSource.gios,
      title: name ?? code ?? '',
      description: '',
      address: street ?? city ?? '',
      location: GeoPoint(latitude: lat, longitude: lng),
      reportedAt:
          _latest(readings.map((reading) => reading.measuredAt)) ??
          DateTime.now(),
      updatedAt: _latest(readings.map((reading) => reading.updatedAt)),
      confirmations: 0,
      areaRadiusMeters: null,
      airReading: AirReading(level: level, pm25: pm25, pm10: pm10),
      photoPath: null,
      reportedByMe: false,
    );
  }
}

extension on AirQualityLevel {
  IncidentSeverity toSeverity() => switch (this) {
    AirQualityLevel.veryGood ||
    AirQualityLevel.good ||
    AirQualityLevel.moderate => IncidentSeverity.low,
    AirQualityLevel.sufficient => IncidentSeverity.medium,
    AirQualityLevel.bad || AirQualityLevel.veryBad => IncidentSeverity.high,
  };
}

DateTime? _latest(Iterable<DateTime?> times) => times.nonNulls.fold<DateTime?>(
  null,
  (latest, time) => latest == null || time.isAfter(latest) ? time : latest,
);
