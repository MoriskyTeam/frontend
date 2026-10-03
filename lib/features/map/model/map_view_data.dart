import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/map/bloc/map_cubit.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';

/// Everything the map screen renders, derived once per state.
class MapViewData {
  MapViewData._({
    required this.origin,
    required this.visible,
    required this.selected,
    required this.lead,
    required this.warnings,
    required this.nearestStation,
    required this.nearestWeather,
    required this.active,
    required this.resolved,
    required this.counts,
    required this.activeNearby,
  });

  factory MapViewData.from(MapState state) {
    final origin =
        state.userLocation?.point ??
        const GeoPoint(latitude: 50.0617, longitude: 19.9373);
    final visible = state.incidents
        .where((incident) => state.enabledLayers.contains(incident.layer))
        .toList();
    final selected = state.incidents.firstWhereOrNull(
      (incident) => incident.id == state.selectedIncidentId,
    );

    bool isListed(Incident incident) =>
        incident.layer == IncidentLayer.infrastructure ||
        incident.layer == IncidentLayer.neighbours;

    final listed = rankByDistance(visible.where(isListed), origin: origin);
    final lead = leadIncident(listed, origin: origin);

    final warnings = visible
        .where(
          (incident) =>
              incident.layer == IncidentLayer.weather &&
              incident.status != IncidentStatus.resolved &&
              incident.distanceTo(origin) <= (incident.areaRadiusMeters ?? 0),
        )
        .sortedBy<num>((incident) => -incident.severity.index);

    final stations = visible.where((incident) => incident.airReading != null);
    final nearestStation = stations.isEmpty
        ? null
        : stations.reduce(
            (a, b) => a.distanceTo(origin) <= b.distanceTo(origin) ? a : b,
          );

    final weatherStations = visible.where(
      (incident) => incident.weatherReading != null,
    );
    final nearestWeather = weatherStations.isEmpty
        ? null
        : weatherStations.reduce(
            (a, b) => a.distanceTo(origin) <= b.distanceTo(origin) ? a : b,
          );

    final counts = <IncidentLayer, int>{
      for (final layer in IncidentLayer.values)
        layer: state.incidents
            .where(
              (incident) =>
                  incident.layer == layer &&
                  incident.status != IncidentStatus.resolved,
            )
            .length,
    };

    final activeNearby = visible
        .where(
          (incident) =>
              incident.status != IncidentStatus.resolved &&
              incident.airReading == null &&
              incident.weatherReading == null &&
              incident.areaRadiusMeters == null &&
              incident.distanceTo(origin) <= nearbyRadiusMeters,
        )
        .length;

    return MapViewData._(
      origin: origin,
      visible: visible,
      selected: selected,
      lead: lead,
      warnings: warnings,
      nearestStation: nearestStation,
      nearestWeather: nearestWeather,
      active: listed
          .where(
            (incident) =>
                incident.status != IncidentStatus.resolved &&
                incident.id != lead?.id,
          )
          .toList(),
      resolved: listed
          .where((incident) => incident.status == IncidentStatus.resolved)
          .toList(),
      counts: counts,
      activeNearby: activeNearby,
    );
  }

  final GeoPoint origin;
  final List<Incident> visible;
  final Incident? selected;
  final Incident? lead;
  final List<Incident> warnings;
  final Incident? nearestStation;

  /// Closest IMGW synoptic station, for the "weather now" row.
  final Incident? nearestWeather;
  final List<Incident> active;
  final List<Incident> resolved;
  final Map<IncidentLayer, int> counts;
  final int activeNearby;
}
