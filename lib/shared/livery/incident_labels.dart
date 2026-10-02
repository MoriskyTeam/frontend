import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';

/// Localised labels for domain enums. Lives in the app layer so the domain
/// stays free of presentation strings.
extension IncidentLabels on AppLocalizations {
  String layer(IncidentLayer layer) => switch (layer) {
    IncidentLayer.infrastructure => layerInfrastructure,
    IncidentLayer.airQuality => layerAirQuality,
    IncidentLayer.weather => layerWeather,
    IncidentLayer.neighbours => layerNeighbours,
  };

  String category(IncidentCategory category) => switch (category) {
    IncidentCategory.powerOutage => categoryPowerOutage,
    IncidentCategory.waterOutage => categoryWaterOutage,
    IncidentCategory.heating => categoryHeating,
    IncidentCategory.flooding => categoryFlooding,
    IncidentCategory.fallenTree => categoryFallenTree,
    IncidentCategory.road => categoryRoad,
    IncidentCategory.trafficLights => categoryTrafficLights,
    IncidentCategory.streetLights => categoryStreetLights,
    IncidentCategory.airQuality => categoryAirQuality,
    IncidentCategory.storm => categoryStorm,
    IncidentCategory.wind => categoryWind,
    IncidentCategory.heat => categoryHeat,
    IncidentCategory.smoke => categorySmoke,
    IncidentCategory.other => categoryOther,
  };

  String severity(IncidentSeverity severity) => switch (severity) {
    IncidentSeverity.low => severityLow,
    IncidentSeverity.medium => severityMedium,
    IncidentSeverity.high => severityHigh,
  };

  String status(IncidentStatus status) => switch (status) {
    IncidentStatus.reported => statusReported,
    IncidentStatus.confirmed => statusConfirmed,
    IncidentStatus.resolved => statusResolved,
  };

  String source(IncidentSource source) => switch (source) {
    IncidentSource.city19115 => sourceCity19115,
    IncidentSource.utility => sourceUtility,
    IncidentSource.imgw => sourceImgw,
    IncidentSource.gios => sourceGios,
    IncidentSource.resident => sourceResident,
  };

  String airLevel(AirQualityLevel level) => switch (level) {
    AirQualityLevel.veryGood => airVeryGood,
    AirQualityLevel.good => airGood,
    AirQualityLevel.moderate => airModerate,
    AirQualityLevel.sufficient => airSufficient,
    AirQualityLevel.bad => airBad,
    AirQualityLevel.veryBad => airVeryBad,
  };

  /// Resident reports may come without a title — fall back to the category.
  String titleOf(Incident incident) =>
      incident.title.isEmpty ? category(incident.category) : incident.title;

  /// Resident reports may come without an address — fall back to the
  /// coordinates they were pinned at.
  String addressOf(Incident incident) => incident.address.isNotEmpty
      ? incident.address
      : '${incident.location.latitude.toStringAsFixed(4)}, '
            '${incident.location.longitude.toStringAsFixed(4)}';

  String ago(DateTime moment, {required DateTime now}) {
    final elapsed = now.difference(moment);
    if (elapsed.inMinutes < 1) return timeNow;
    if (elapsed.inHours < 1) return minutesAgo(elapsed.inMinutes);
    return hoursAgo(elapsed.inHours);
  }
}
