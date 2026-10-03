import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_cluster.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/air_halo_layer.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/cluster_bubble.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/incident_marker.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/radar_layer.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/user_location_marker.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/warning_zone_layer.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/neutral_tile_layer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Rynek Główny — the camera's starting point before a position arrives.
const krakowCentre = LatLng(50.0617, 19.9373);

/// The live city map: neutral OSM basemap, rain radar, air halos, warning
/// areas and clustered markers.
///
/// Moves the camera to [selected] whenever it changes, keeping it clear of
/// whatever overlays the bottom [focusInset] of the map.
class CityMap extends HookWidget {
  const CityMap({
    required this.incidents,
    required this.selected,
    required this.arrivedIds,
    required this.userLocation,
    required this.radar,
    required this.focusInset,
    required this.topInset,
    required this.reveal,
    required this.recenter,
    required this.onIncidentTap,
    required this.onMapTap,
    required this.controller,
    super.key,
  });

  final List<Incident> incidents;
  final Incident? selected;
  final Set<String> arrivedIds;
  final UserLocation? userLocation;

  /// Precipitation radar to lay under the markers, null to hide it.
  final RadarFrame? radar;

  /// Screen space at the bottom covered by the sheet (or zero on wide
  /// layouts), read when the camera moves.
  final double Function() focusInset;

  /// Screen space at the top covered by the status card and chips.
  final double Function() topInset;

  /// Live arrivals to bring into view without selecting them.
  final ValueListenable<Incident?> reveal;

  /// Each bump flies the camera to the resident's current position.
  final ValueListenable<int> recenter;
  final ValueChanged<Incident> onIncidentTap;
  final VoidCallback onMapTap;
  final MapController controller;

  static const _initialZoom = 13.4;
  static const _focusZoom = 15.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    // Camera callbacks fire after this build (post-frame, onMapReady, live
    // reveals), so they read the latest props instead of a captured build.
    final latest = useRef(this)..value = this;
    final mapReady = useRef(false);
    final flight = useRef<_Flight?>(null);
    final camera = useAnimationController(duration: RcbMotion.camera);

    useOnListenableChange(camera, () {
      final current = flight.value;
      if (current == null) return;
      current.apply(
        latest.value.controller,
        Curves.easeInOutCubic.transform(camera.value),
      );
    });

    void flyTo(LatLng target, double zoom) {
      // A shared link can select before the map has laid out; onMapReady
      // replays the focus then.
      if (!mapReady.value) return;
      final map = latest.value;
      // Centre the target in the band between the top chrome and the sheet.
      final offset = Offset(0, (map.topInset() - map.focusInset()) / 2);
      if (reduceMotion) {
        map.controller.move(target, zoom, offset: offset);
        return;
      }
      final from = map.controller.camera;
      flight.value = _Flight(
        fromCenter: from.center,
        toCenter: target,
        fromZoom: from.zoom,
        toZoom: zoom,
        offset: offset,
      );
      camera.forward(from: 0);
    }

    void focusSelected() {
      final selected = latest.value.selected;
      if (selected == null) return;
      final zoom = selected.areaRadiusMeters != null ? 12.0 : _focusZoom;
      flyTo(selected.location.latLng, zoom);
    }

    /// Pans (without zooming) so a live arrival lands in the clear band
    /// between the top chrome and the sheet — the odblask sweep must play
    /// where the resident can see it.
    void revealArrival() {
      final map = latest.value;
      final incident = map.reveal.value;
      if (incident == null || !mapReady.value || map.selected != null) return;
      final view = map.controller.camera;
      final point = view.latLngToScreenOffset(incident.location.latLng);
      final top = map.topInset();
      final bottom = view.size.height - map.focusInset();
      const margin = incidentMarkerExtent;
      final visible =
          point.dx >= margin &&
          point.dx <= view.size.width - margin &&
          point.dy >= top + margin &&
          point.dy <= bottom - margin;
      if (!visible) flyTo(incident.location.latLng, view.zoom);
    }

    /// Zooms until a cluster's members fit on screen with room around them.
    void zoomInto(List<Incident> members) {
      if (!mapReady.value) return;
      final camera = latest.value.controller.camera;
      final fitted = CameraFit.coordinates(
        coordinates: [for (final m in members) m.location.latLng],
        padding: const EdgeInsets.all(incidentMarkerExtent * 1.5),
        maxZoom: clusteringOffZoom + 1.0,
      ).fit(camera);
      flyTo(fitted.center, math.max(fitted.zoom, camera.zoom + 1));
    }

    useOnListenableChange(reveal, revealArrival);
    useOnListenableChange(recenter, () {
      final location = latest.value.userLocation;
      if (location != null) flyTo(location.point.latLng, _focusZoom);
    });

    useEffect(() {
      if (selected != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => focusSelected());
      }
      return null;
    }, [selected?.id]);

    useEffect(() {
      final location = userLocation;
      if (location != null && selected == null) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => flyTo(location.point.latLng, 14),
        );
      }
      return null;
    }, [userLocation != null]);

    final selectedId = selected?.id;
    final warnings = [
      for (final incident in incidents)
        if (incident.areaRadiusMeters != null &&
            incident.status != IncidentStatus.resolved)
          incident,
    ];

    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: krakowCentre,
        initialZoom: _initialZoom,
        minZoom: 10,
        maxZoom: 18,
        backgroundColor: dark ? RcbColors.night : RcbColors.bone,
        cameraConstraint: polandCameraConstraint,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        onTap: (_, _) => onMapTap(),
        onMapReady: () {
          mapReady.value = true;
          focusSelected();
        },
      ),
      children: [
        const NeutralTileLayer(),
        if (radar case final frame?) RadarLayer(frame: frame),
        AirHaloLayer(incidents: incidents, dimmed: selectedId != null),
        WarningZoneLayer(warnings: warnings, selectedId: selectedId),
        if (userLocation case final location?)
          CircleLayer(
            circles: [
              CircleMarker(
                point: location.point.latLng,
                radius: nearbyRadiusMeters.toDouble(),
                useRadiusInMeter: true,
                color: Colors.transparent,
                borderColor: (dark ? RcbColors.nightInk : RcbColors.asphalt)
                    .withValues(alpha: 0.35),
                borderStrokeWidth: 1,
              ),
            ],
          ),
        _IncidentMarkers(
          incidents: incidents,
          selectedId: selectedId,
          arrivedIds: arrivedIds,
          onIncidentTap: onIncidentTap,
          onClusterTap: zoomInto,
        ),
        if (userLocation case final location?)
          MarkerLayer(
            markers: [
              Marker(
                point: location.point.latLng,
                width: 28,
                height: 28,
                child: UserLocationMarker(label: l10n.myLocation),
              ),
            ],
          ),
      ],
    );
  }
}

/// Incident markers, grouped into [ClusterBubble]s while zoomed out.
///
/// Reads the camera, so it rebuilds as the map moves; the grouping itself
/// only changes with whole zoom levels.
class _IncidentMarkers extends HookWidget {
  const _IncidentMarkers({
    required this.incidents,
    required this.selectedId,
    required this.arrivedIds,
    required this.onIncidentTap,
    required this.onClusterTap,
  });

  final List<Incident> incidents;
  final String? selectedId;
  final Set<String> arrivedIds;
  final ValueChanged<Incident> onIncidentTap;
  final ValueChanged<List<Incident>> onClusterTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final camera = MapCamera.of(context);
    final zoomLevel = camera.zoom.floor();
    final clusters = useMemoized(
      () {
        final groups = clusterIncidents(
          incidents,
          camera: camera,
          standalone: {?selectedId, ...arrivedIds},
        );
        // Low severity first so serious incidents sit on top, the
        // selection above everything.
        return groups..sort((a, b) {
          if (a.seed.id == selectedId) return 1;
          if (b.seed.id == selectedId) return -1;
          final byGroup = (a.isSingle ? 0 : 1).compareTo(b.isSingle ? 0 : 1);
          if (byGroup != 0) return byGroup;
          return a.seed.severity.index.compareTo(b.seed.severity.index);
        });
      },
      [incidents, zoomLevel, selectedId, arrivedIds],
    );

    return MarkerLayer(
      markers: [
        for (final cluster in clusters)
          if (cluster.isSingle)
            Marker(
              key: ValueKey(cluster.key),
              point: cluster.point,
              width: incidentMarkerExtent,
              height: incidentMarkerExtent,
              child: IncidentMarker(
                incident: cluster.seed,
                selected: cluster.seed.id == selectedId,
                dimmed: selectedId != null && cluster.seed.id != selectedId,
                arrived: arrivedIds.contains(cluster.seed.id),
                semanticLabel:
                    '${l10n.titleOf(cluster.seed)}, '
                    '${l10n.severity(cluster.seed.severity)}, '
                    '${l10n.source(cluster.seed.source)}',
                onTap: () => onIncidentTap(cluster.seed),
              ),
            )
          else
            Marker(
              key: ValueKey(cluster.key),
              point: cluster.point,
              width: clusterBubbleExtent,
              height: clusterBubbleExtent,
              child: ClusterBubble(
                members: cluster.members,
                dimmed: selectedId != null,
                semanticLabel: l10n.clusterLabel(cluster.members.length),
                onTap: () => onClusterTap(cluster.members),
              ),
            ),
      ],
    );
  }
}

/// One camera move, interpolated by the shared camera controller.
class _Flight {
  const _Flight({
    required this.fromCenter,
    required this.toCenter,
    required this.fromZoom,
    required this.toZoom,
    required this.offset,
  });

  final LatLng fromCenter;
  final LatLng toCenter;
  final double fromZoom;
  final double toZoom;
  final Offset offset;

  void apply(MapController controller, double t) {
    controller.move(
      LatLng(
        lerpDouble(fromCenter.latitude, toCenter.latitude, t)!,
        lerpDouble(fromCenter.longitude, toCenter.longitude, t)!,
      ),
      lerpDouble(fromZoom, toZoom, t)!,
      offset: Offset.lerp(Offset.zero, offset, t)!,
    );
  }
}
