import 'package:data/src/model/incident/incident_dto.dart';
import 'package:data/src/model/incident/submit_report_dto.dart';
import 'package:domain/domain.dart';

extension IncidentDTOMapper on IncidentDTO {
  Incident toDomain() {
    final category = this.category.toIncidentCategory();
    return Incident(
      id: id!,
      layer: layer.toIncidentLayer(fallback: category.defaultLayer),
      category: category,
      severity: severity.toIncidentSeverity(),
      status: status.toIncidentStatus(),
      source: source.toIncidentSource(),
      // Resident reports may arrive without a title or address; the
      // presentation layer derives labels from category and coordinates.
      title: title ?? '',
      description: description ?? '',
      address: address ?? '',
      location: GeoPoint(latitude: lat ?? 0, longitude: lng ?? 0),
      reportedAt: reportedAt ?? DateTime.now(),
      updatedAt: updatedAt,
      confirmations: confirmations ?? 0,
      areaRadiusMeters: areaRadiusMeters,
      airReading: airReading?.toDomain(),
      photoPath: photoPath,
      reportedByMe: reportedByMe ?? false,
    );
  }
}

extension AirReadingDTOMapper on AirReadingDTO {
  AirReading toDomain() => AirReading(
    level:
        AirQualityLevel.fromReadings(pm25: pm25, pm10: pm10) ??
        indexLevel.toAirQualityLevel(),
    pm25: pm25,
    pm10: pm10,
  );
}

extension SubmitReportRequestMapper on SubmitReportRequest {
  SubmitReportDTO toData() => SubmitReportDTO(
    category: category.toData(),
    lat: location.latitude,
    lng: location.longitude,
    description: description,
    photoPath: photoPath,
  );
}

extension IncidentCategoryDataMapper on IncidentCategory {
  String toData() => switch (this) {
    IncidentCategory.powerOutage => 'power_outage',
    IncidentCategory.waterOutage => 'water_outage',
    IncidentCategory.heating => 'heating',
    IncidentCategory.flooding => 'flooding',
    IncidentCategory.fallenTree => 'fallen_tree',
    IncidentCategory.road => 'road',
    IncidentCategory.trafficLights => 'traffic_lights',
    IncidentCategory.streetLights => 'street_lights',
    IncidentCategory.airQuality => 'air_quality',
    IncidentCategory.storm => 'storm',
    IncidentCategory.wind => 'wind',
    IncidentCategory.heat => 'heat',
    IncidentCategory.smoke => 'smoke',
    IncidentCategory.other => 'other',
  };
}

extension IncidentEnumMapper on String? {
  IncidentCategory toIncidentCategory() => IncidentCategory.values.firstWhere(
    (category) => category.toData() == this,
    orElse: () => IncidentCategory.other,
  );

  IncidentLayer toIncidentLayer({required IncidentLayer fallback}) =>
      switch (this) {
        'infrastructure' => IncidentLayer.infrastructure,
        'air_quality' => IncidentLayer.airQuality,
        'weather' => IncidentLayer.weather,
        'neighbours' => IncidentLayer.neighbours,
        _ => fallback,
      };

  IncidentSeverity toIncidentSeverity() => switch (this) {
    'high' => IncidentSeverity.high,
    'medium' => IncidentSeverity.medium,
    _ => IncidentSeverity.low,
  };

  IncidentStatus toIncidentStatus() => switch (this) {
    'confirmed' => IncidentStatus.confirmed,
    'resolved' => IncidentStatus.resolved,
    _ => IncidentStatus.reported,
  };

  IncidentSource toIncidentSource() => switch (this) {
    'city19115' => IncidentSource.city19115,
    'utility' => IncidentSource.utility,
    'imgw' => IncidentSource.imgw,
    'gios' => IncidentSource.gios,
    _ => IncidentSource.resident,
  };
}

extension AirQualityLevelMapper on int? {
  AirQualityLevel toAirQualityLevel() => switch (this) {
    0 => AirQualityLevel.veryGood,
    1 => AirQualityLevel.good,
    2 => AirQualityLevel.moderate,
    3 => AirQualityLevel.sufficient,
    4 => AirQualityLevel.bad,
    5 => AirQualityLevel.veryBad,
    _ => AirQualityLevel.moderate,
  };
}
