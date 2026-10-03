import 'dart:ui';

import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Markers within this many screen pixels of a cluster's seed join it.
const clusterRadiusPixels = 46.0;

/// From this zoom on every incident stands on its own.
const clusteringOffZoom = 15;

/// Incidents drawn as one bubble at the current zoom.
class IncidentCluster {
  IncidentCluster(this.seed, this._seedPixel) : members = [seed];

  /// The most serious member; the cluster is anchored on it.
  final Incident seed;
  final Offset _seedPixel;
  final List<Incident> members;

  bool get isSingle => members.length == 1;

  LatLng get point {
    if (isSingle) return seed.location.latLng;
    var lat = 0.0;
    var lng = 0.0;
    for (final member in members) {
      lat += member.location.latitude;
      lng += member.location.longitude;
    }
    return LatLng(lat / members.length, lng / members.length);
  }

  /// Stable across rebuilds so the marker keeps its element.
  String get key => isSingle ? seed.id : 'cluster:${seed.id}';
}

/// Greedy screen-space clustering, computed at whole zoom levels so
/// panning and pinch never reshuffle the groups mid-gesture.
///
/// Incidents in [standalone] (the selection, fresh arrivals) are never
/// absorbed, they need their own marker.
List<IncidentCluster> clusterIncidents(
  List<Incident> incidents, {
  required MapCamera camera,
  required Set<String> standalone,
}) {
  final zoom = camera.zoom.floorToDouble();
  Offset pixel(Incident incident) =>
      camera.projectAtZoom(incident.location.latLng, zoom);

  if (zoom >= clusteringOffZoom) {
    return [
      for (final incident in incidents)
        IncidentCluster(incident, pixel(incident)),
    ];
  }

  // Serious, active incidents seed first so they anchor their group.
  final ranked = [...incidents]
    ..sort((a, b) {
      final byActive = (b.status != IncidentStatus.resolved ? 1 : 0).compareTo(
        a.status != IncidentStatus.resolved ? 1 : 0,
      );
      if (byActive != 0) return byActive;
      return b.severity.index.compareTo(a.severity.index);
    });

  final clusters = <IncidentCluster>[];
  for (final incident in ranked) {
    final at = pixel(incident);
    if (!standalone.contains(incident.id)) {
      final home = clusters.where(
        (cluster) =>
            !standalone.contains(cluster.seed.id) &&
            (cluster._seedPixel - at).distance <= clusterRadiusPixels,
      );
      if (home.isNotEmpty) {
        home.first.members.add(incident);
        continue;
      }
    }
    clusters.add(IncidentCluster(incident, at));
  }
  return clusters;
}
