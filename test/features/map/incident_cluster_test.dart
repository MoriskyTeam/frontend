import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_cluster.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

Incident _incident(
  String id, {
  required double lat,
  double lng = 19.9373,
  IncidentSeverity severity = IncidentSeverity.medium,
}) => Incident(
  id: id,
  layer: IncidentLayer.infrastructure,
  category: IncidentCategory.powerOutage,
  severity: severity,
  status: IncidentStatus.reported,
  source: IncidentSource.city19115,
  title: id,
  description: '',
  address: '',
  location: GeoPoint(latitude: lat, longitude: lng),
  reportedAt: DateTime(2026),
  updatedAt: null,
  confirmations: 0,
  areaRadiusMeters: null,
  airReading: null,
  weatherReading: null,
  photoPath: null,
  reportedByMe: false,
);

MapCamera _camera(double zoom) => MapCamera(
  crs: const Epsg3857(),
  center: const LatLng(50.0617, 19.9373),
  zoom: zoom,
  rotation: 0,
  nonRotatedSize: const Size(400, 800),
);

void main() {
  // ~30 m apart: one spot at city zoom, separate up close.
  final low = _incident('low', lat: 50.0617, severity: IncidentSeverity.low);
  final high = _incident('high', lat: 50.0620, severity: IncidentSeverity.high);
  // ~5 km north, always on its own.
  final far = _incident('far', lat: 50.1067);

  test(
    'GIVEN two incidents on one spot and one far away,\n'
    'WHEN clustered at city zoom,\n'
    'THEN the near pair forms one cluster anchored on the serious one',
    () {
      final clusters = clusterIncidents(
        [low, high, far],
        camera: _camera(12),
        standalone: const {},
      );

      expect(clusters, hasLength(2));
      final pair = clusters.singleWhere((cluster) => !cluster.isSingle);
      expect(pair.seed, high);
      expect(pair.members, unorderedEquals([low, high]));
    },
  );

  test(
    'GIVEN the same incidents,\n'
    'WHEN shown at street zoom,\n'
    'THEN nothing is clustered',
    () {
      final clusters = clusterIncidents(
        [low, high, far],
        camera: _camera(clusteringOffZoom.toDouble()),
        standalone: const {},
      );

      expect(clusters.every((cluster) => cluster.isSingle), isTrue);
    },
  );

  test(
    'GIVEN a selected incident on a crowded spot,\n'
    'WHEN clustered,\n'
    'THEN it keeps its own marker',
    () {
      final clusters = clusterIncidents(
        [low, high, far],
        camera: _camera(12),
        standalone: const {'low'},
      );

      expect(clusters, hasLength(3));
      expect(clusters.every((cluster) => cluster.isSingle), isTrue);
    },
  );
}
