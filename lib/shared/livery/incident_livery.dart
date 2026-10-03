import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:flutter/material.dart';

/// Battenburg livery per layer: the fill colour, the ink drawn on it, and the
/// second colour of the checker used for high severity.
@immutable
class Livery {
  const Livery({
    required this.fill,
    required this.onFill,
    required this.checker,
    required this.outlineInk,
  });

  final Color fill;
  final Color onFill;

  /// Second colour of the Battenburg checker (the first is [fill]).
  final Color checker;

  /// Ink for the hollow (low severity) marker variant on the bone ground.
  final Color outlineInk;
}

extension IncidentLayerLivery on IncidentLayer {
  Livery get livery => switch (this) {
    IncidentLayer.infrastructure => const Livery(
      fill: RcbColors.amber,
      onFill: RcbColors.asphalt,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.amberInk,
    ),
    IncidentLayer.weather => const Livery(
      fill: RcbColors.signalRed,
      onFill: Colors.white,
      checker: RcbColors.boneRaised,
      outlineInk: RcbColors.signalRed,
    ),
    IncidentLayer.neighbours => const Livery(
      fill: RcbColors.patrolBlue,
      onFill: Colors.white,
      checker: RcbColors.hiVis,
      outlineInk: RcbColors.patrolBlue,
    ),
    IncidentLayer.airQuality => const Livery(
      fill: RcbColors.airModerate,
      onFill: RcbColors.asphalt,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.asphalt,
    ),
  };

  IconData get icon => switch (this) {
    IncidentLayer.infrastructure => Icons.bolt_rounded,
    IncidentLayer.airQuality => Icons.air_rounded,
    IncidentLayer.weather => Icons.warning_amber_rounded,
    IncidentLayer.neighbours => Icons.people_alt_rounded,
  };
}

extension AirQualityLevelLivery on AirQualityLevel {
  Livery get livery => switch (this) {
    AirQualityLevel.veryGood => const Livery(
      fill: RcbColors.airVeryGood,
      onFill: RcbColors.asphalt,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.asphalt,
    ),
    AirQualityLevel.good => const Livery(
      fill: RcbColors.airGood,
      onFill: RcbColors.asphalt,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.asphalt,
    ),
    AirQualityLevel.moderate => const Livery(
      fill: RcbColors.airModerate,
      onFill: RcbColors.asphalt,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.asphalt,
    ),
    AirQualityLevel.sufficient => const Livery(
      fill: RcbColors.airSufficient,
      onFill: RcbColors.asphalt,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.asphalt,
    ),
    AirQualityLevel.bad => const Livery(
      fill: RcbColors.airBad,
      onFill: Colors.white,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.airBad,
    ),
    AirQualityLevel.veryBad => const Livery(
      fill: RcbColors.airVeryBad,
      onFill: Colors.white,
      checker: RcbColors.asphalt,
      outlineInk: RcbColors.airVeryBad,
    ),
  };
}

const _weatherStation = Livery(
  fill: RcbColors.boneSunken,
  onFill: RcbColors.asphalt,
  checker: RcbColors.asphalt,
  outlineInk: RcbColors.asphaltMuted,
);

extension IncidentLivery on Incident {
  /// Air stations are tinted by their index, weather stations stay neutral
  /// (a measurement, not a warning), everything else follows its layer.
  Livery get livery =>
      airReading?.level.livery ??
      (weatherReading != null ? _weatherStation : layer.livery);

  bool get isActive => status != IncidentStatus.resolved;
}

extension IncidentCategoryIcon on IncidentCategory {
  IconData get icon => switch (this) {
    IncidentCategory.powerOutage => Icons.power_off_rounded,
    IncidentCategory.waterOutage => Icons.format_color_reset_rounded,
    IncidentCategory.heating => Icons.thermostat_rounded,
    IncidentCategory.flooding => Icons.flood_rounded,
    IncidentCategory.fallenTree => Icons.park_rounded,
    IncidentCategory.road => Icons.construction_rounded,
    IncidentCategory.trafficLights => Icons.traffic_rounded,
    IncidentCategory.streetLights => Icons.lightbulb_outline_rounded,
    IncidentCategory.airQuality => Icons.air_rounded,
    IncidentCategory.storm => Icons.thunderstorm_rounded,
    IncidentCategory.wind => Icons.storm_rounded,
    IncidentCategory.heat => Icons.wb_sunny_rounded,
    IncidentCategory.weatherStation => Icons.device_thermostat_rounded,
    IncidentCategory.smoke => Icons.local_fire_department_rounded,
    IncidentCategory.other => Icons.report_rounded,
  };
}
